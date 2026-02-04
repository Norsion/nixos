{ config, ... }:

{
  programs.zsh = {
    enable                    = true;
    enableCompletion          = true;
    autosuggestion.enable     = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "main" ];
      styles = {
        # Comments
        "comment"  ="fg=#585b70";
        
        "alias" ="fg=#a6e3a1";
        "suffix-alias" ="fg=#a6e3a1";
        "global-alias" ="fg=#a6e3a1";
        "function" ="fg=#a6e3a1";
        "command" = "fg=#a6e3a1";
        "precommand" = "fg=#a6e3a1,italic";
        "autodirectory" = "fg=#fab387,italic";
        "single-hyphen-option"  = "fg=#fab387";
        "double-hyphen-option"  = "fg=#fab387";
        "back-quoted-argument"  = "fg=#cba6f7";
        # Keywords
        # Built ins
        "builtin" = "fg=#a6e3a1";
        "reserved-word" = "fg=#f8aa2d";
        "hashed-command" = "fg=#a6e3a1";
        # Punctuation
        "commandseparator"="fg=#f38ba8";
        "command-substitution-delimiter"="fg=#cdd6f4";
        "command-substitution-delimiter-unquoted"="fg=#cdd6f4";
        "process-substitution-delimiter"="fg=#cdd6f4";
        "back-quoted-argument-delimiter"="fg=#f38ba8";
        "back-double-quoted-argument"="fg=#f38ba8";
        "back-dollar-quoted-argument"="fg=#f38ba8";
        # Serializable / Configuration Languages
        # Storage
        # Strings
        "command-substitution-quoted"="fg=#f9e2af";
        "command-substitution-delimiter-quoted"="fg=#f9e2af";
        "single-quoted-argument"="fg=#f9e2af";
        "single-quoted-argument-unclosed"="fg=#eba0ac";
        "double-quoted-argument"="fg=#f9e2af";
        "double-quoted-argument-unclosed"="fg=#eba0ac";
        "rc-quote"="fg=#f9e2af";
        # Variables
        "dollar-quoted-argument"="fg=#cdd6f4";
        "dollar-quoted-argument-unclosed"="fg=#eba0ac";
        "dollar-double-quoted-argument"="fg=#cdd6f4";
        "assign"="fg=#cdd6f4";
        "named-fd"="fg=#cdd6f4";
        "numeric-fd"="fg=#cdd6f4";
        # No category relevant in spec
        "unknown-token" = "fg=#eba0ac";
        "path" = "fg=#cdd6f4,underline";
        "path_pathseparator" = "fg=#f38ba8,underline";
        "path_prefix" = "fg=#cdd6f4,underline";
        "path_prefix_pathseparator" = "fg=#f38ba8,underline";
        "globbing" = "fg=#cdd6f4";
        "history-expansion" = "fg=#cba6f7";

        "back-quoted-argument-unclosed" = "fg=#eba0ac";
        "redirection" = "fg=#cdd6f4";
        "arg0" = "fg=#cdd6f4";
        "default" = "fg=#cdd6f4";
      };
    };

    initExtra = ''
                export EDITOR="nvim"
            '';

    shellAliases =
      let
        flakeDir = "~/nix";
      in {
        rb   = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd  = "nix flake update ${flakeDir}";
        upg  = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
        ctr  = "nix-collect-garbage -d";
        ctrt = "nix-collect-garbage -d --delete-older-than 10d";

        hms = "home-manager switch --flake ${flakeDir}";

        conf			= "nvim ${flakeDir}/modules/configuration.nix";
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
