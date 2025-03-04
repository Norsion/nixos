{ pkgs, ...}: 
{
  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-dark";
      package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "lavender";
      };
    };
    gtk4 = {
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };
}