{ config, pkgs, ... }:

{ # Version control 
  home.packages = with pkgs; 
  [
      ctags
      rsync
      gnutar
      # needed for Xmonad
      feh
      # rxvt_unicode-with-plugins
      # some X packages
      xsel
      # vlc
      pavucontrol 
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
      # Kube infrastructure
      # minikube
      # helm
      # terraform
      # aws
  ];

  xsession = {
    enable = true;
    windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
          config = ./xmonad.hs;
        };
      }; 
  };
  
  programs = {
    chromium.enable = true; 
    # bash.enable = true;
    # dconf.enable = true; # add for gnome programs (opera, firefox etc.)
    home-manager.enable = true;
    bash = {
      enable = true;
      historyControl = ["erasedups"];
      historyIgnore = [ "ls" "cd" "exit" "nix-shell" ];
      sessionVariables = { ERL_AFLAGS = "-kernel shell_history enabled"; };
    };
    
    git = {
        enable = true;
        userName = "Hristo Kochev";
        userEmail = "h.l.kochev@gmail.com";
    };

    vim = {
        enable = true;
        extraConfig = builtins.readFile (./vimrc);
        plugins = import (./vimPlugins.nix) {inherit pkgs;};
        settings = {
          history = 1000;
          background = "dark";
          number = true;
          tabstop = 2;
        };
    };

  # Browsers and Extensions
    firefox = {
      enable = true;
      # enableIcedTea = true;
      # extraPackages = epkgs: [ ];
    }; 
  };
}
