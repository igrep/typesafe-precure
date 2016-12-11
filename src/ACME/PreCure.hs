module ACME.PreCure
  ( module P
  , PreCureMonad
  ) where


import qualified ACME.PreCure.Monad as M
import           ACME.PreCure.Monad as P hiding (PreCureMonad)
import           ACME.PreCure.Types as P
import           ACME.PreCure.Textbook as P


-- To hide Monad.Skeleton when using on GHCi
type PreCureMonad = M.PreCureMonad
