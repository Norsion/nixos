{ pkgs, ... }:
{
	# Kyok (sans-serif), Baro (sidebar clock), Custom Iosevka (monospace)
  fonts = {
    packages = with pkgs; [
    		jetbrains-mono
    		noto-fonts
    		noto-fonts-color-emoji
				iosevka
    		twemoji-color-font
    		font-awesome
        openmoji-color
    		powerline-fonts
    		powerline-symbols
				nerd-fonts.symbols-only
    		#(nerd-fonts.override { fonts = [ "JetBrainsMono" ]; })
  	];
    fontconfig = {
      hinting.autohint = true;
      defaultFonts = { 
				sansSerif = ["JetBrainsMono"];
				monospace = ["Noto Mono"];
				emoji = [ "OpenMoji Color" ]; 
			};
    };
  };
}