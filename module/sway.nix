# wm and wayland comositors options
{ lib, config, ... }:

{
	  services.gnome.gnome-keyring.enable = lib.mkForce false;
		environment.variables.XDG_CURRENT_DESKTOP = "sway";

    programs.waybar.enable = true;
		programs.sway = {
			enable = true;
			wrapperFeatures = {
				base = true;
				gtk  = true;
			};
		};
}
