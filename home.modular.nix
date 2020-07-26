{config, pkgs, ...}:

{
  users.me = {pkgs, ...}:

  let homeDir   = "/home/me/"; # builtins.getEnv "Home";
      configDir = path: homeDir + "nixConfig/" + path;  
  in rec {
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowBroken = false;
        allowUnsupportedSystem = false;
      };
    };

    home.packages = with pkgs; 
    [
      ctags
      rsync
      gnutar
      # needed for Xmonad
      feh
      # rxvt_unicode-with-plugins
      # some X packages
      vlc
      # pavucontrol 
      # unrar
      unzip
      htop
      # vim
      opera
      # NOTE: iana-etc is needed by nix-build for stack 
      # stack
      iana-etc
      # dconf for gnome3 UI
      # gnome3.dconf   
    ];
  
    programs.git = {
      enable = true;
      userName = "Hristo Kochev";
      userEmail = "h.l.kochev@gmail.com";
    };


    programs = {
      chromium.enable = true; 
      bash.enable = true;
      dconf.enable = true; # add for gnome programs (opera, firefox etc.)

      vim = {
        enable = true;
        extraConfig = builtins.readFile (configDir "vimrc");
        plugins = import (configDir "vimPlugins.nix");
      };
     
      # Let Home Manager install and manage itself.
      home-manager.enable = true;
    };  
    # }; 
}
