{ inputs, pkgs, config, lib, ... }:
{
  # add the home manager module
  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    
    # additional packages to add to gjs's runtime
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
    ];
  };

  home.file =
    lib.mkMerge [
      {
        ".config/ags/config.js".source = ./config/config.js;
      }
    ];
}