{ config, pkgs, ... }: {
	home = {

		# Home Manager needs a bit of information about you and the
  		# paths it should manage.		
		username = "hitonoe";
		homeDirectory = "/home/hitonoe";
		stateVersion = "23.11";

		packages = with pkgs; [
			neofetch
			obsidian
		];
	};
	
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
		};
	};

	programs.neovim = {
		enable = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
			gruvbox-material
			nerdtree
		]
	}
	
	# Let Home Manager install and manage itself.
  	programs.home-manager.enable = true;
}
