{ self, pkgs, config, ... }:

let
  theme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  wallpaper = "${self}/wpaperd/wallpaper/Anime-Fireworks.png";
in
{
  stylix = {
    
    enable = true;
    image = wallpaper;
    polarity = "dark";
    autoEnable = true;

    base16Scheme = theme;
    

    opacity = {
      applications = 0.8;
      terminal = 0.8;
      popups = 0.8;
      desktop = 0.8;
    };
  };
}