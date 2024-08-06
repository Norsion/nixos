{ config, ... }:

{
  programs.zsh = {
    enable                    = true;
    enableCompletion          = true;
    autosuggestion.enable     = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
                export EDITOR="nvim"
            '';

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
        rb  = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "nix flake update ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

        hms = "home-manager switch --flake ${flakeDir}";

        conf			= "nvim ${flakeDir}/modules/configuration.nix";
			  hyprconf	= "nvim ${flakeDir}/home/config/hyprland/default.nix";
			  wbconf		= "nvim ${flakeDir}/home/config/waybar/default.nix";
        pkgs			= "nvim ${flakeDir}/modules/env.nix";

        ll = "ls -loah";
        v  = "nvim";
        nv = "nvim -i NONE";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    oh-my-zsh = {
      enable  = true;
      plugins = [ "git" "sudo" ];
      theme   = "agnoster"; 
    };
  };
}
