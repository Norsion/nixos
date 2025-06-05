{ pkgs, self, ... }:
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
		./config/foot
		./config/sway
		./config/swaync
		#./config/gnome
		./config/vscode
	];

  stylix = {
  	enable 			 = true;
  	image 			 = ./wallpapers/milk/balcony.jpg;
  	polarity 		 = "dark";
  	autoEnable 	 = true;
  	base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  
  	opacity = {
  	  applications = 0.8;
  	  terminal 		 = 0.8;
  	  popups       = 0.8;
  	  desktop      = 0.8;
  	};
  };
}
