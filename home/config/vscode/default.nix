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

      userSettings = {
        "chat.editor.fontFamily"= lib.mkDefault "JetBrainsMono";
        "chat.editor.fontSize"= 16.0;
        "debug.console.fontFamily"= lib.mkDefault "JetBrainsMono";
        "debug.console.fontSize"= 16.0;
        "editor.fontFamily"= lib.mkDefault "JetBrainsMono";
        "editor.fontSize"= 16.0;
        "editor.inlayHints.fontFamily"= lib.mkDefault "JetBrainsMono";
        "editor.inlineSuggest.fontFamily"= lib.mkDefault "JetBrainsMono";
        "editor.minimap.sectionHeaderFontSize"= 10.285714285714286;
        "extensions.autoCheckUpdates"= false;
        "markdown.preview.fontFamily"= lib.mkDefault "JetBrainsMono";
        "markdown.preview.fontSize"= 16.0;
        "scm.inputFontFamily"= lib.mkDefault "JetBrainsMono";
        "scm.inputFontSize"= 14.857142857142858;
        "screencastMode.fontSize"= 64.0;
        "terminal.integrated.fontSize"= 16.0;
        "update.mode"= "none";
        "workbench.colorTheme"= "Stylix";
        "workbench.activityBar.location"= "top";
        "workbench.secondarySideBar.defaultVisibility"= "visible";
        "outline.showVariables"= false;
      };
    };
}