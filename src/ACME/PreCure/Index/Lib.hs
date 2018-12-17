module ACME.PreCure.Index.Lib
  ( loadImportedModules
  , isTextbookMod
  , loadAnnotations
  )
where


import           Data.Data
                   ( Data
                   )
import           Data.List
                   ( isPrefixOf
                   )
import           Language.Haskell.TH
                   ( AnnLookup(AnnLookupModule)
                   , ModuleInfo(ModuleInfo)
                   , Q
                   , reifyAnnotations
                   , reifyModule
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
