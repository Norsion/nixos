{ self, config, ... }:

{
  services.swaync = {
    enable = true;

    settings = {

      # Custom style
      style = builtins.readFile "${self}/home/config/swaync/style.css";
    };
  };
}