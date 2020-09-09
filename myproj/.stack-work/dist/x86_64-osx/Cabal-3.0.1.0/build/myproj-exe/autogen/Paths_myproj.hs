{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_myproj (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/hector.pina/Desktop/zuul/Haskell_learning/haskell-servant-server/myproj/.stack-work/install/x86_64-osx/924e8047425d971a20657f1129c532a027fd7f28eacaccd9614e87dc69190621/8.8.4/bin"
libdir     = "/Users/hector.pina/Desktop/zuul/Haskell_learning/haskell-servant-server/myproj/.stack-work/install/x86_64-osx/924e8047425d971a20657f1129c532a027fd7f28eacaccd9614e87dc69190621/8.8.4/lib/x86_64-osx-ghc-8.8.4/myproj-0.1.0.0-Ef2fDrcmz3nHUp4Al1kRpA-myproj-exe"
dynlibdir  = "/Users/hector.pina/Desktop/zuul/Haskell_learning/haskell-servant-server/myproj/.stack-work/install/x86_64-osx/924e8047425d971a20657f1129c532a027fd7f28eacaccd9614e87dc69190621/8.8.4/lib/x86_64-osx-ghc-8.8.4"
datadir    = "/Users/hector.pina/Desktop/zuul/Haskell_learning/haskell-servant-server/myproj/.stack-work/install/x86_64-osx/924e8047425d971a20657f1129c532a027fd7f28eacaccd9614e87dc69190621/8.8.4/share/x86_64-osx-ghc-8.8.4/myproj-0.1.0.0"
libexecdir = "/Users/hector.pina/Desktop/zuul/Haskell_learning/haskell-servant-server/myproj/.stack-work/install/x86_64-osx/924e8047425d971a20657f1129c532a027fd7f28eacaccd9614e87dc69190621/8.8.4/libexec/x86_64-osx-ghc-8.8.4/myproj-0.1.0.0"
sysconfdir = "/Users/hector.pina/Desktop/zuul/Haskell_learning/haskell-servant-server/myproj/.stack-work/install/x86_64-osx/924e8047425d971a20657f1129c532a027fd7f28eacaccd9614e87dc69190621/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myproj_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myproj_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myproj_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myproj_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myproj_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myproj_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
