{ self, config, ... }:

{
  # A simple notification daemon with a GTK gui for notifications and the control center
  services.swaync = {
    enable = true;

    settings = {

      # Custom style
      style = builtins.readFile "${self}/home/config/swaync/style.css";
    };
  };
}