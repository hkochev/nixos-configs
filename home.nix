{ config, pkgs, ... }:

{ # Version control 
  programs.git = {
    enable = true;
    userName = "Hristo Kochev";
    userEmail = "h.l.kochev@gmail.com";
  };

  # Browsers and Extensions
  programs.firefox = {
    enable = true;
    enableIcedTea = true;
    extraPackages = epkgs: [
    ];
  }; 
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
