# wm and wayland comositors options
{ lib, config, pkgs, ... }:

{
	  services.gnome.gnome-keyring.enable = lib.mkForce false;
		environment.variables.XDG_CURRENT_DESKTOP = "sway";

    #programs.waybar.enable = true;
		programs.sway = {
			enable = true;
			#package = pkgs.swayfx;
			wrapperFeatures = {
				base = true;
				gtk  = true; #Whether to enable the wrapGAppsHook wrapper to execute sway with required environment variables for GTK applications.
			};
		};
}
