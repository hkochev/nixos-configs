## SYSTEMD
{config, pkgs, ...}:

{ 
    # nix-daemon.enable = true;
    # services.backlight-leds-tpacpi--kbd_backlight.enable = false;
    user.services."urxvtd" = {
      enable = true;
      description = "rxvt unicode daemon";
      wantedBy = [ "default.target" ];
      path = [ pkgs.rxvt_unicode ];
      serviceConfig.Restart = "always";
      serviceConfig.RestartSec = 2;
      serviceConfig.ExecStart = "${pkgs.rxvt_unicode}/bin/urxvtd -q -o";
    };
 }
