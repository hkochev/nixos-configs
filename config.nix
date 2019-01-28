pkgs : {
  allowUnfree = true;
  ignoreCollisions = true;
  # allowBroken = true;
  firefox.enableGoogleTalkPlugin = true;
  firefox.enableEsteid = true;

  # chromium = {
  #  enablePepperFlash = true; # Chromium's non-NSAPI alternative to Adobe Flash
  # enablePepperPDF = true;
  # };
  # myBrowsers = import ./browsers.nix;
  # myHask = import ./haskell.nix { inherit (pkgs)  stdenv; };

  packageOverrides = pkgs : with pkgs; rec {
      myHaskellEnv = pkgs.haskellPackages.ghcWithHoogle
                     (haskellPackages: with haskellPackages; [
                       # libraries
                       # arrows async cgi 
                       # criterion
                       # pretty-show
                       # temporary 
                       # tools
                       cabal-install doctest hlint stylish-haskell hpack hdevtools # ghc-mod  
                     ]);
      myVim = import ./vim.nix;
      thinkpad = pkgs.buildEnv {
        name = "thinkpad";
        paths = [
          myHaskellEnv
          myVim
          neovim
          ctags
          rsync
        ];
      };
  };
}
