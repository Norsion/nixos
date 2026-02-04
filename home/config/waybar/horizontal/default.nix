{ self, lib, pkgs, ... }:
 {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "graphical-session.target";

    style = lib.mkAfter ''
        ${builtins.readFile "${self}/home/config/waybar/horizontal/style.css"}
      '';
  };

  xdg.configFile."waybar/config".source = lib.mkForce ''${self}/home/config/waybar/horizontal/config.jsonc'';
  # Optionally, for styling:
  xdg.configFile."waybar/style.css".source = lib.mkForce ''./waybar/horizontal/style.css'';
}