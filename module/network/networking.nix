{ config, pkgs, lib, ... }:
let
    lan = "lo";
    wan = "enp6s0";
in
{
    systemd = {
        network.enable = true;

        services = {
            NetworkManager-wait-online.enable = false;
            systemd-networkd-wait-online.enable = lib.mkForce false;
        };
    };

    networking = {                              # networking options
        # bonds = ;
        # bridges = ;
        #dns = [
        #  "::1"
        #  "1.1.1.1"
        #  "8.8.8.8"
        #];

        firewall = {                            # firewall options
            checkReversePath = false;
            allowPing = false;                   # you can restrict ping to your host in case you'll need
            # allowedTCPPorts = [ ... ];        # allowed ports TCP and UDP, below option for ranges
            # allowedTCPPortRanges = [ 
                # { from = ...; to = ...; }
            # ];
            allowedUDPPorts = [ 51830 ]; 
            # allowedUDPPortRanges = [ 
                # { from = ...; to = ...; }
            # ];
            #enable = true;                      # toggle for enabling firewall
            # if packets are still dropped, they will show up in dmesg
            
            ##logReversePathDrops = true;
            # wireguard trips rpfilter up
            ##extraCommands = ''
                # Full access from Lan.
            ##    ip46tables -I INPUT -j ACCEPT -i ${lan}


            ##    ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51830 -j RETURN
            ##    ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51830 -j RETURN
            ##'';
            ##extraStopCommands = ''
            ##    ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51830 -j RETURN || true
            ##    ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51830 -j RETURN || true
            ##'';
        };
        hostName = "nixos";  # hostname for ur PC
        networkmanager = {                      # NM options
            enable = true;                      # toggle for NM
            #dns    = "default";                    # dns option for NM
            #wifi = {                            # NM toggles for wireless
            #    backend = "wpa_supplicant";     # backend behind NM wireless
            #    macAddress = "preserve";        # you can set macaddress
            #};
        };
        # proxy = {                             # proxy things
            # allProxy = ;
            # default = ;
            # ftpProxy = ;
            # httpProxy = ;
            # httpsProxy = ;
            # noProxy = ;
            # rsyncProxy = ;
        # };
        useDHCP = lib.mkDefault true; # DHCP setting. you MUST follow generated hardware-configuration.nix
        interfaces.${wan}.useDHCP = true;
    
    };
    time = {                                    # basically TZ and HW clocks
        timeZone = "Europe/Saratov";             # TZ, see https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
        hardwareClockInLocalTime = false;       # keep the hardware clock in local time instead of UTC in case being "toggle"
    };
}
