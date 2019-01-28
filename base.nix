{pkgs}: 

baseEnv = lib.lowPrio (
        buildEnv {
          name = "base-env";
          ignoreCollisions = true;
          paths = [ 
            # my-pidgin-with-plugins
            /*androidenv.platformTools*/
            # perlPackages.ack
            aspell
            aspellDicts.en
            # aspellDicts.ru
            bc
            defaultStdenv
            # djview4
            # evince
            file
            flac
            freetype
            dejavu_fonts
            # gnome3.zenity
            # gnupg
            # gparted
            # iftop
            # lastfmsubmitd
            libnotify
            lm_sensors
            # mocPulse
            # mutt
            # nethogs
            # p7zip
            # pass
            # pinentry
            # psmisc
            # python27Packages.goobook
            # qutebrowser
            # skype
            # sxiv
            telnet
            # tightvnc
            tmux
            traceroute
            tree
            unrar
            unzip
            usbutils
            vlc
            # weechat
            which
            # wineUnstable
            # winetricks
            # wmname
            xsel
            xkblayout-state
            xlibs.xev
            xlibs.xprop
            xfce.xfce4notifyd
            xfce.xfce4terminal
            zip
          ];
        }
      );
