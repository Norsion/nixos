{ config, pkgs, ... }:
{
    services = {
        desktopManager.gnome.enable = true; # toggle for GNOME DE
        xserver = {
            enable = true; 
        };
    };
}
