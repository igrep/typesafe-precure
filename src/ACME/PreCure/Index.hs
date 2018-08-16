{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Index where


import           Control.Monad
                   ( forM
                   )
import           Data.Aeson
                   ( encode
                   )
import           Data.Aeson.Encode.Pretty
                   ( encodePretty
                   )
import           Data.Data
                   ( Data
                   )
import qualified Data.ByteString.Lazy as ByteString
import           Language.Haskell.TH
                   ( Q
                   , thisModule
                   , runIO
                   , tupE
                   )
import           Language.Haskell.TH.Syntax
                   ( Module
                   )

import           ACME.PreCure.Textbook ()
import           ACME.PreCure.Index.Lib
import           ACME.PreCure.Index.Types


writeCureIndexJson :: ()
writeCureIndexJson =
  $( do
        textbookRootMod <-
          fmap (head . filter isTextbookMod) . loadImportedModules =<< thisModule :: Q Module
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
