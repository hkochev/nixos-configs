{config, lib, pkgs, ...}:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
     pciutils
     rfkill
     usbutils
     telnet
     traceroute
     tree
     wget
     curl
     git
     openssh
     # vpnc 
     # NOTE: not needed currently
     vim
     # For the KVM and Ruby VM
     # kvm
     # qemu
     # bridge-utils
     powertop
     # tlp
     acpi
     linuxPackages.acpi_call
     tpacpi-bat
     # linuxPackages.tp_smapi
     # busybox
     # binutils      
     # rxvt-unicode-with-perl-with-unicode3
     rxvt_unicode-with-plugins
     # X11 packages
     # chromium
     # firefoxWrapper
     # trayer
     stalonetray
     dmenu
     # xscreensaver
     xclip
     #xchat

     # Font junk
     xfontsel
     xlsfonts
     # xmodmap
     xcompmgr  
     # Backlight 
     brightnessctl
     # xorg.xbacklight  
     # haskell staff  
     # haskellPackages.haskellPlatform
     # cabal2nix
     # Haskell packages for XMonad
     haskellPackages.xmobar
     haskellPackages.xmonad
     haskellPackages.xmonad-contrib
     haskellPackages.xmonad-extras
     haskellPackages.yeganesh
     # additinal fonts 
     # ubuntu-font-family
     # vista-fonts

     # Tools && Utils
     # htop
     # universal-ctags
     # feh

     # Browsers and UI tools
     # firefox 
     # gnome3.dconf 
  ];

  fonts = {
    enableFontDir = true;
    fonts = with pkgs; [
      # corefonts
      dina-font
      fantasque-sans-mono
      gohufont
      inconsolata
      proggyfonts
      #source-code-pro
      ubuntu_font_family
      #ipafont
      kochi-substitute
    ];
  };
} 
