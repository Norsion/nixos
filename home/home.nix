{ config, pkgs, lib, self, ... }:
{
	home = {
		username			= "hitonoe";
		homeDirectory = "/home/hitonoe";
		stateVersion	= "24.05";
	};

	imports = [
		#./config/wofi
		./config/nvim
		./config/fuzzel
		./config/zsh
		./config/waybar
		#./config/cursor
		./config/git
		./config/firefox
		./config/firefox/textfox
		#./config/librewolf
		#./config/librewolf/textfox
		./config/foot
		./config/sway
		#./config/swaync
		#./config/gnome
		#./config/ags
		./config/vscode
	];

	stylix = {
  	enable 			 = true;
  	image 			 = ./wallpapers/nature/1748600615928976.png;
  	polarity 		 = "dark";
  	autoEnable 	 = true;
  	base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-terminal-dark.yaml";

		# tokyo-night-terminal-dark
		# tokyo-night-moon
		# gruvbox-material-dark-soft
  
  	opacity = {
  	  applications = 0.8;
  	  terminal 		 = 0.8;
  	  popups       = 0.8;
  	  desktop      = 0.8;
  	};

		#cursor = {
		#	name = "mochaDark";
		#	package = pkgs.catppuccin-cursors;
		#	size = 24;
		#};
		fonts = {
      monospace = {
        package = pkgs.noto-fonts;
        name = "Noto Fonts";
      };
    };
  };

	gtk = {
		enable = true;
	};

	programs = {
		direnv = {
			enable = true;
			nix-direnv.enable = true;
			enableZshIntegration = true;
		};
		zsh.enable = true;
	};

	# home.pointerCursor = {
  #   name = lib.mkForce "Bibata-Original-Custom";
  #   size = lib.mkForce 24;
  #   gtk.enable = true;
	# };
}
