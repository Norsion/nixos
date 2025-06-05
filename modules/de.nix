{ config, pkgs, ... }:
{
    services = {
        xserver = {
            enable = true; 
            desktopManager= {
	            gnome.enable = true; # toggle for GNOME DE
            };
        };
    };
}
