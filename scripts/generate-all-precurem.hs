{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}

import           Control.Monad.IO.Class          (liftIO)
import           Control.Monad.Trans.Writer.Lazy (execWriterT, tell)
import qualified Data.Aeson                      as Json
import           Data.Foldable                   (for_)
import qualified Data.List                       as L
import qualified Data.Set as S
import           Data.String                     (fromString)
import           Data.String.Here.Interpolated   (i)

import qualified ACME.PreCure.Index              as P

main :: IO ()
main = do
  idx <- either fail return =<< Json.eitherDecodeFileStrict' "gen/cure-index.json"
  (referredPfs, referredNPfs) <- execWriterT $
    for_ (P.indexTransformations idx) $ \tf -> do
      let tfIdass = map fromString $ P.transformationTransformees tf
          pfs  =
            filter
              (\pf -> P.purificationPurifiers pf == tfIdass)
              (P.indexPurifications idx)
          npfs =
            filter
              (\pf -> P.nonItemPurificationPurifiers pf == tfIdass)
              (P.indexNonItemPurifications idx)
      liftIO $ putStrLn $ template tf tfIdass pfs npfs
      tell (S.fromList pfs, S.fromList npfs)

  putStrLn "{---- NOT REFERRED PURIFICATIONS -------------"
  for_ (filter (`S.notMember` referredPfs) (P.indexPurifications idx)) $ \nrpf ->
    putStrLn [i|purify ${restoreAsValueTuple $ P.purificationPurifiers nrpf} ${restoreAsValueTuple $ P.purificationSpecialItems nrpf}|]
  putStrLn "END NOT REFERRED PURIFICATIONS -}"

  putStrLn "{---- NOT REFERRED NON-ITEM PURIFICATIONS -------------"
  for_ (filter (`S.notMember` referredNPfs) (P.indexNonItemPurifications idx)) $ \nrnpf ->
    putStrLn [i|purifyWithoutItem ${restoreAsValueTuple $ P.nonItemPurificationPurifiers nrnpf}|]
  putStrLn "END NOT REFERRED NON-ITEM PURIFICATIONS -}"


template :: P.Transformation -> [P.IdAttachments] -> [P.Purification] -> [P.NonItemPurification] -> String
template tf tfIdass pfs npfs =
  let transformers = P.transformationTransformers tf
      transformees = P.transformationTransformees tf
      transformItemsForName =
        L.intercalate "_"
          $ L.concatMap flattenIdAttachments
          $ P.transformationSpecialItems tf
      transformItemsTuple = restoreAsValueTuple $ P.transformationSpecialItems tf

      enterLines = init $ unlines $ map toEnter transformers
      transformersTuple = restoreAsValueTuple transformers

      transformeesTuple = restoreAsValueTuple tfIdass

      purificationLines =
        if null pfs
          then "  -- NO PURIFICATIONS"
          else
            unlines
              $ (`map` pfs)
              $ \pf ->
                let purificationItemsTuple = restoreAsValueTuple $ P.purificationSpecialItems pf
                 in [i|  purify ${transformeesTuple} ${purificationItemsTuple}|]

      nonItemPurificationLines =
        if null npfs
          then "  -- NO NONITEM PURIFICATIONS"
          else [i|  purifyWithoutItem ${transformeesTuple}|]
  in
    [i|act_${L.intercalate "_" transformees}_${transformItemsForName} = printEpisode $ do
${enterLines}
  transform ${transformersTuple} ${transformItemsTuple}
${purificationLines :: String}
${nonItemPurificationLines :: String}

|]
 where
  toEnter ida = [i|  enter ${restoreAsValue ida}|]

  flattenIdAttachments :: P.IdAttachments -> [String]
  flattenIdAttachments idas =
    P.idAttachementsI idas : L.concatMap flattenIdAttachments (P.idAttachementsA idas)


restoreAsValue :: P.IdAttachments -> String
restoreAsValue idas =
  if null (P.idAttachementsA idas)
    then P.idAttachementsI idas
    else [i|(${P.idAttachementsI idas} ${restoreAsValueTuple $ P.idAttachementsA idas})|]


restoreAsValueTuple :: [P.IdAttachments] -> String
restoreAsValueTuple [] = ""
restoreAsValueTuple [idas] = restoreAsValue idas
restoreAsValueTuple idass =
    "(" ++ L.intercalate ", " (map restoreAsValue idass) ++ ")"
