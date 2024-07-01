{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # enableAutosuggestions = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

      hms = "home-manager switch --flake ${flakeDir}";

      conf  = "nvim ${flakeDir}/configuration.nix";
			hconf = "nvim ${flakeDir}/home.d/modules.d/wm/hyprland/hyprland.nix";
			wconf = "nvim ${flakeDir}/home.d/modules.d/wm/waybar/waybar.nix";
      pkgs  = "nvim ${flakeDir}/host/modules.d/env.nix";

      ll = "ls -loah";
      v = "nvim";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster"; # blinks is also really nice
    };
  };
}
