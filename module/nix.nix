{ config, pkgs, libs, ... }:

{
	nix = {
		gc = {
			automatic  = true;
			dates      = "weekly";
			options    = "--delete-older-than 30d";
		};

		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
		};

		optimise = {
			automatic = true;
		};
	}; 
}
