# wm and wayland comositors options
{ lib, config, ... }:

{
    programs.waybar.enable = true;
		programs.sway = {
			enable = true;
			wrapperFeatures = {
				base = true;
				gtk  = true;
			};
		};
}
