{
  self,
  pkgs,
  lib,
  config,
  ...
}:

{

  imports = [
    "${self}/home/config/vscode/extensions"
  ];

  programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
    };
}