# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # boot opions from nixos-source
  boot = {

    # Use the GRUB 2 boot loader.
    loader.grub.enable = true;
    loader.grub.version = 2;
    # boot.loader.grub.efiSupport = true;
    # boot.loader.grub.efiInstallAsRemovable = true;
    # boot.loader.efi.efiSysMountPoint = "/boot/efi";
    # Define on which hard drive you want to install Grub.
    loader.grub.device = "/dev/sda"; # or "nodev" for efi only
    kernelModules = [ "tun" "virtio" "cpufreq_stats"  "acpi" "thinkpad-acpi" "tp_acpi" ];
    kernelParams = [
      # Kernel GPU Savings Options (NOTE i915 chipset only)
      # "drm.debug=0" "drm.vblankoffdelay=1" "i915.semaphores=1" "i915.modeset=1"
      # "i915.use_mmio_flip=1" "i915.powersave=1" "i915.enable_ips=1"
      # "i915.disable_power_well=1" "i915.enable_hangcheck=1"
      # "i915.enable_cmd_parser=1" "i915.fastboot=0" "i915.enable_ppgtt=1"
      # "i915.reset=0" "i915.lvds_use_ssc=0" "i915.enable_psr=0" "vblank_mode=0"
      "i915.i915_enable_fbc=1"
      "i915.i915_enable_rc6=1"
      "i915.i915_semaphores=1"
      # X1 power tweeks
      "intel_pstate=enable" 
      # Frameboofer
      # "i915.enable_fbc=1"
      # SSD with NOOP
      "elevetor=noop"
    ];
    
    # initrd.kernelModules = ["acpi" "thinkpad-acpi" "tp_acpi" "acpi_call"];
    
    extraModulePackages = [
      # pkgs.linuxPackages.virtualbo
      config.boot.kernelPackages.tp_smapi
      config.boot.kernelPackages.acpi_call 
    ];
 
    blacklistedKernelModules = [
      # Kernel GPU Savings Options (NOTE i915 chipset only)
      #  "sierra_net" "cdc_mbim" "cdc_ncm" "btusb"
      # "kvm-intel"	
    ];
  };

  hardware.cpu.intel.updateMicrocode = true;
  systemd.services.nix-daemon.enable = true;
  # systemd.services.backlight-leds-tpacpi--kbd_backlight.enable = false;

  networking = {
    hostName = "thinkpad"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
#    firewall.allowedTCPPorts = [ 22 80 111 2049 875 893 2049 8080 9000 10053 32769 ];
#    nat = {
#	enable = true;
#        internalInterfaces = ["ve-+"];
#	externalInterface = "enp0s20f0u6";
#    };
#    Forwarding for the Ruby VM
#    localCommands =
#    ''
#      ${pkgs.vde2}/bin/vde_switch -tap tap0 -mod 660 -group kvm -daemon
#      ip addr add 10.0.2.1/24 dev tap0
#      ip link set dev tap0 up
#      ${pkgs.procps}/sbin/sysctl -w net.ipv4.ip_forward=1
#      ${pkgs.iptables}/sbin/iptables -t nat -A POSTROUTING -s 10.0.2.0/24 -j MASQUERADE
#    '';
#	
  };

  fileSystems."/data" =
  { device = "/dev/disk/by-label/data";
    fsType = "ext4";
    options = [ "nofail" ];
  };
 
# Containers
#####################
#   containers = {
#     web = {
# 	autoStart = true;
# 	privateNetwork = true;
# 	};
#  };

  powerManagement.enable = true;
  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

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
     tlp
     acpi
     linuxPackages.acpi_call
     tpacpi-bat
     linuxPackages.tp_smapi
     # busybox
     # binutils      
     # rxvt-unicode-with-perl-with-unicode3
     rxvt_unicode
     # X11 packages
     # chromium
     firefoxWrapper
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
 
     # haskell staff  
     # haskellPackages.haskellPlatform
     #cabal2nix
     # Haskell packages for XMonad
     haskellPackages.xmobar
     haskellPackages.xmonad
     haskellPackages.xmonad-contrib
     haskellPackages.xmonad-extras
     haskellPackages.yeganesh
     # additinal fonts 
     # ubuntu-font-family
     # vista-fonts

  ];

  # Virtualisation
  ######################33  
  # virtualisation.docker.enable = true;
  # List services that you want to enable:
  # NOTE: was needed for ruby VM 
  # virtualisation.libvirtd.enable = true;
  # virtualisation.libvirtd.enableKVM = true;

    # VPNC settings
    # vpnc = {
    #    enable = true;
    # }; 
 
  # services.vpnc.enable = true; 
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # storage and NFS shares options
  # storage = 
  #  {
  # services.portmap.enable = true;
  # services.nfs.server.enable = true;
  # services.nfs.server.exports = ''
  #      /data/home/me 10.0.2.2(rw,no_root_squash,no_subtree_check,fsid=0)
  # '';
  # services.nfs.server.createMountPoints = true;
  #  };
 
  # TLP enable
  services.tlp.enable = true;
  services.tlp.extraConfig = 
    # TLP DEFAULT Laptop tweeks
    ''
     CPU_SCALING_GOVERNOR_ON_BAT=powersave
     WIFI_PWR_ON_AC=off
     USB_AUTOSUSPEND=0
     START_CHARGE_THRESH_BAT0=90 
     STOP_CHARGE_THRESH_BAT0=94
    '';   
      
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = { 
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      synaptics.enable = true;
  # services.xserver.vaapiDrivers = [ pkgs.vaapiIntel ];
  
  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # svervices.xserver.desktopManager.kde4.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;  
  # services.xserver.desktopManager.enlightenment.enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = haskellPackages: [
        haskellPackages.xmonad-contrib
        haskellPackages.xmonad-extras
        haskellPackages.xmonad
      ];
    };
    #  windowManager.xmonad.enable = true;
      windowManager.default = "xmonad";
      desktopManager.xterm.enable = true;
      desktopManager.default = "none";
      # startAgent = true;
      displayManager = {
        slim = {
	        enable = true;
	        defaultUser = "me";
        };
      };
#      sessionCommands = ''
#        ${pkgs.xlibs.xrdb}/bin/xrdb -merge ~/.Xresources
#        ${pkgs.xlibs.xsetroot}/bin/xsetroot -cursor_name left_ptr #sets cursor
#        ${pkgs.feh}/bin/feh --bg-fill ~/wallpapers/windy.jpg
#        ${pkgs.xcape}/bin/xcape -e "Shift_L=parenleft;Shift_R=parenright"
#      '';
  };


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

  services.udisks2.enable = true;
  hardware.pulseaudio.enable = true;
  # ALSA Sound extra configuration
  sound.extraConfig = "ALSA_CARD=HDMI";	
  # services.xserver.desktopManager.e17.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraGroups.me.gid = 1000;
  users.extraUsers.me = {
    isNormalUser = true;
     uid = 1000;
     home = "/home/me";
     extraGroups = [ "wheel"  "networkmanger" ]; # add docker here for docker access
  ## SYSTEMD

  systemd.user.services."urxvtd" = {
    enable = true;
    description = "rxvt unicode daemon";
    wantedBy = [ "default.target" ];
    path = [ pkgs.rxvt_unicode ];
    serviceConfig.Restart = "always";
    serviceConfig.RestartSec = 2;
    serviceConfig.ExecStart = "${pkgs.rxvt_unicode}/bin/urxvtd -q -o";
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.autoUpgrade.enable = true;
  # system.autoUpgrade.channel = https://nixos.org/channels/nixos-17.03;  
  system.stateVersion = "18.03";
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
