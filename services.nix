{config, pkgs, ...}:

{
  # List services that you want to enable:
  # services.vpnc.enable = true; 
  # Enable the OpenSSH daemon.
    openssh.enable = true;

  # syslog-ng
    syslog-ng.enable = true;
    syslogd.enableNetworkInput = true;
    # Should be active now 
    journald.forwardToSyslog = true; 

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
    tlp.enable = true;
    tlp.extraConfig = 
      # TLP DEFAULT Laptop tweeks
      ''
       CPU_SCALING_GOVERNOR_ON_BAT=powersave
       WIFI_PWR_ON_AC=off
       USB_AUTOSUSPEND=0
       NATACPI_ENABLE=1
       TPACPI_ENABLE=1
       TPSMAPI_ENABLE=0
       START_CHARGE_THRESH_BAT0=76 
       STOP_CHARGE_THRESH_BAT0=80
      '';   
        
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
    xserver = { 
      enable = true;
      layout = "us";
      xkbOptions = "eurosign:e";
      synaptics.enable = true;
  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # svervices.xserver.desktopManager.kde4.enable = true;
  # services.xserver.desktopManager.xfce.enable = true;  
  # services.xserver.desktopManager.enlightenment.enable = true;
      desktopManager.xterm.enable = true;
      # desktopManager.default = "none";
      displayManager = {
      };
    };
  # services.xserver.desktopManager.e17.enable = true;
    dbus.packages = with pkgs; [ gnome3.dconf ];
 }
