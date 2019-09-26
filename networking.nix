{config, pkgs, ...}:

{
    hostName = "thinkpad"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;
    firewall = { 
      allowPing = true;
      allowedTCPPorts = [ 
        22 80 111 443 2049 875 893 2049 8080 9000 10053 32769 
      ];
      allowedTCPPortRanges = [
        { from = 8000; to = 8100; }
        { from = 55000; to = 60000; }
      ];

      allowedUDPPortRanges = [
        { from = 9000; to = 10000; }
        { from = 55000; to = 60000; }
      ];
    };  

    nat = {
	enable = true;
        internalInterfaces = ["ve-+"];
	externalInterface = "enp0s20f0u6";
      };

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
}
