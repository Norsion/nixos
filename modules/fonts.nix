{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
    		jetbrains-mono
    		noto-fonts
    		noto-fonts-emoji
    		twemoji-color-font
    		font-awesome
        openmoji-color
    		powerline-fonts
    		powerline-symbols
    		(nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  	];
    fontconfig = {
      hinting.autohint = true;
      defaultFonts = { emoji = [ "OpenMoji Color" ]; };
    };
  };
}