{ pkgs, ... }:
{
	wayland.windowManager.sway = {
			enable = true;
			config = {
				modifier = "Mod4";
				terminal = "foot";
				startup = [
					{command = "foot";}
				];
			};
		};
		home.packages = with pkgs; [
			swaybg 
			wl-clipboard 
			sway
		];
}

