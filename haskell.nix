{
  packageOverrides = super: let self = super.pkgs; in
  {
    myHaskellEnv = self.haskellPackages.ghcWithHoogle
                     (haskellPackages: with haskellPackages; [
                       # libraries
                       # arrows async cgi criterion
                       # tools
                       cabal-install haskintex hlint
                     ]);
  };
}
