module Paths_BindingOfHaskell (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/hunter/Documents/Game/.cabal-sandbox/bin"
libdir     = "/Users/hunter/Documents/Game/.cabal-sandbox/lib/x86_64-osx-ghc-7.8.4/BindingOfHaskell-0.1.0.0"
datadir    = "/Users/hunter/Documents/Game/.cabal-sandbox/share/x86_64-osx-ghc-7.8.4/BindingOfHaskell-0.1.0.0"
libexecdir = "/Users/hunter/Documents/Game/.cabal-sandbox/libexec"
sysconfdir = "/Users/hunter/Documents/Game/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "BindingOfHaskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "BindingOfHaskell_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "BindingOfHaskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "BindingOfHaskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "BindingOfHaskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
