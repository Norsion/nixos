{ pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        xwayland.enable = true;
    };
    home.packages = with pkgs; [
	    wofi 
        swaybg 
        wlsunset 
        wl-clipboard 
        hyprland
	];

    home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
