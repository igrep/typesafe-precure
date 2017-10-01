{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Index where


import           Control.Monad
                   ( forM
                   )
import           Data.Aeson
                   ( encode
                   )
import           Data.Data
                   ( Data
                   )
import           Data.Text
                   ( Text
                   )
import           Data.Text.Encoding
                   ( decodeUtf8
                   )
import           Data.ByteString.Lazy.Char8
                   ( toStrict
                   )
import           Instances.TH.Lift ()
import           Language.Haskell.TH
                   ( Q
                   , thisModule
                   -- , runIO
                   )
import           Language.Haskell.TH.Lift
                   ( lift
                   )
import           Language.Haskell.TH.Syntax
                   ( Module
                   )

import           ACME.PreCure.Textbook ()
import           ACME.PreCure.Index.Lib
import           ACME.PreCure.Index.Types


cureIndexJson :: Text
cureIndexJson =
  $( do
        textbookRootMod <-
          fmap (head . filter isTextbookMod) . loadImportedModules =<< thisModule :: Q Module
        -- ^ ACME.PreCure.Textbook

        modsImportedByRoot <- loadImportedModules textbookRootMod :: Q [Module]

        textbookMods <-
            fmap (filter isTextbookMod . concat) $ mapM loadImportedModules modsImportedByRoot :: Q [Module]
          -- ^ ACME.PreCure.Textbook.*

        let collectAnnotationsFromEachSeriesModules :: Data a => Q [a]
            collectAnnotationsFromEachSeriesModules =
              fmap concat $ forM textbookMods $ \eachSeriesMod {- ACME.PreCure.Textbook.*.* -} ->
                concat <$> loadAnnotations eachSeriesMod

        gs <- collectAnnotationsFromEachSeriesModules
        ts <- collectAnnotationsFromEachSeriesModules
        is <- collectAnnotationsFromEachSeriesModules
        trs <- collectAnnotationsFromEachSeriesModules

        lift $ decodeUtf8 $ toStrict $ encode $ mkIndex gs ts is trs
    )
