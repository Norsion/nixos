{ config, pkgs, ... }: {
	home = {

		# Home Manager needs a bit of information about you and the
  		# paths it should manage.		
		username = "hitonoe";
		homeDirectory = "/home/hitonoe";
		stateVersion = "23.11";

		packages = with pkgs; [
			neofetch
		];
	};
	
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch";
		};
	};
	
	# Let Home Manager install and manage itself.
  	programs.home-manager.enable = true;
}
