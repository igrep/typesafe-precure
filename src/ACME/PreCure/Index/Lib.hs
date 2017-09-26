module ACME.PreCure.Index.Lib
  ( loadImportedModules
  , isTextbookMod
  , getModName
  , getImportedModules
  , loadAnnotations
  , deriveToJsonWithoutTypeNamePrefix
  )
where


import           Data.Aeson.TH
                   ( deriveToJSON
                   )
import qualified Data.Aeson as Json
import           Data.Aeson.Types
                   ( Options(fieldLabelModifier)
                   )
import           Data.Char
                   ( toLower
                   )
import           Data.Data
                   ( Data
                   )
import           Data.List
                   ( isPrefixOf
                   )
import           Language.Haskell.TH
                   ( AnnLookup(AnnLookupModule)
                   , ModuleInfo(ModuleInfo)
                   , Name
                   , Dec
                   , Q
                   , reifyAnnotations
                   , reifyModule
                   , nameBase
                   )
import           Language.Haskell.TH.Syntax
                   ( Module(Module)
                   , ModName(ModName)
                   )


loadImportedModules :: Module -> Q [Module]
loadImportedModules = fmap getImportedModules . reifyModule


isTextbookMod :: Module -> Bool
isTextbookMod = ("ACME.PreCure.Textbook" `isPrefixOf`) . getModName


loadAnnotations ::  Data a => Module -> Q [a]
loadAnnotations = reifyAnnotations . AnnLookupModule


getModName :: Module -> String
getModName (Module _ (ModName modName)) = modName


getImportedModules :: ModuleInfo -> [Module]
getImportedModules (ModuleInfo mods) = mods


deriveToJsonWithoutTypeNamePrefix :: Name -> Q [Dec]
deriveToJsonWithoutTypeNamePrefix name =
  deriveToJSON Json.defaultOptions { fieldLabelModifier = firstLower . drop (length $ nameBase name) } name


firstLower :: String -> String
firstLower (x:xs) = toLower x : xs
firstLower _ = error "firstLower: Assertion failed: empty string"
