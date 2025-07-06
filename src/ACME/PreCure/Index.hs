{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module ACME.PreCure.Index where


import           Control.Monad              (forM)
import           Data.Aeson                 (encode)
import           Data.Aeson.Encode.Pretty   (encodePretty)
import qualified Data.ByteString.Lazy       as ByteString
import           Data.Data                  (Data)
import           Language.Haskell.TH        (Q, runIO, thisModule, tupE)
import           Language.Haskell.TH.Syntax (Module)
import           Safe                       (headNote)

import           ACME.PreCure.Index.Lib
import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook      ()


writeCureIndexJson :: ()
writeCureIndexJson =
  $( do
        let e = "Assertion failure: empty textbook root module."
        textbookRootMod <-
          fmap (headNote e . filter isTextbookMod) . loadImportedModules =<< thisModule :: Q Module
        -- ^ ACME.PreCure.Textbook

        modsImportedByRoot <- loadImportedModules textbookRootMod :: Q [Module]

        let collectAnnotationsFromEachSeriesModules :: Data a => Q [a]
            collectAnnotationsFromEachSeriesModules =
              fmap concat . forM modsImportedByRoot $ \eachSeriesMod {- ACME.PreCure.Textbook.* -} ->
                concat <$> loadAnnotations eachSeriesMod

        index <-
          mkIndex
            <$> collectAnnotationsFromEachSeriesModules
            <*> collectAnnotationsFromEachSeriesModules
            <*> collectAnnotationsFromEachSeriesModules
            <*> collectAnnotationsFromEachSeriesModules
            <*> collectAnnotationsFromEachSeriesModules
            <*> collectAnnotationsFromEachSeriesModules
            <*> collectAnnotationsFromEachSeriesModules
        runIO $ ByteString.writeFile "gen/cure-index.json" $ encode index
        runIO $ ByteString.writeFile "gen/pretty-cure-index.json" $ encodePretty index
        tupE []
    )
