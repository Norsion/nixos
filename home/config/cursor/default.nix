{ pkgs, config, inputs, ... }: 
{
  #home.pointerCursor = {
  #  gtk.enable = true;
  #  name = "Catppuccin-Mocha-Light-Cursors";
  #  package = pkgs.catppuccin-cursors.mochaLight;
  #  size = 24;
  #};

  #dconf.settings = {
  #  "org/gnome/desktop/interface" = {
  #    cursorTheme = "Catppuccin-Mocha-Light-Cursors";
  #    cursorSize  = "24";
  #  };
  #};

  home.pointerCursor = {
    package = inputs.nix-cursors.packages.${pkgs.system}.bibata-original-cursor.override {
        background_color = "#271C3A";
        outline_color = "#EDEAEF";
        accent_color = "#271C3A";
      };
    name = "Bibata-Original-Custom";
    size = 24;
    gtk.enable = true;
  };
}
