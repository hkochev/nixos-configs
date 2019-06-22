haskellPackages: 
{  haskellEnv = haskellPackages.ghcWithHoogle
                 (haskellPackages: with haskellPackages; [
                   # libraries
                   # arrows async cgi 
                   # criterion
                   # pretty-show
                   # temporary 
                   
                   # tools
                   cabal-install 
                   doctest hlint 
                   stylish-haskell 
                   hpack 
                   hdevtools 
                   # ghc-mod  
                 ]);
}
