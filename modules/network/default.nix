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

        hostName = "nixos";  # hostname for ur PC
        networkmanager = {                      # NM options
            enable = true;                      # toggle for NM
            #dns    = lib.mkDefault "default";                    # dns option for NM
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
        interfaces = {
            enp6s0.useDHCP = true;
        };
        nameservers = [ "1.1.1.1" "8.8.8.8" "8.8.4.4" ];

        firewall = {
            enable = true;
            allowPing = false;
            allowedTCPPorts = [
                22 # ssh
                80 
                443 # HTTP/HTTPS
            ];
        };
    };
    time = {                                    # basically TZ and HW clocks
        timeZone = "Europe/Saratov";             # TZ, see https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
        hardwareClockInLocalTime = false;       # keep the hardware clock in local time instead of UTC in case being "toggle"
    };
}
