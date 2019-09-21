haskellPackages: 
{  haskellEnv = haskellPackages.ghcWithHoogle
                 (haskellPackages: with haskellPackages; [
                   # libraries
                   # arrows async cgi 
                   # criterion
                   # pretty-show
                   # temporary 
                   
                   # cabal
                   cabal-install
                   cabal2nix

                   # test && linters
                   doctest 
                   hlint 
                   stylish-haskell 
                   # tools
                   hpack 
                   hdevtools
                   ghcid
                   # ghc-mod  
                  
                   # tools
                   stack
                   # stack2nix
 
                 ]);
}
