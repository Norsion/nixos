{ pkgs, lib, ... }:
{
	# NixOS:
	nix.settings.experimental-features = [ "nix-command" "flakes" "pipe-operators" ];

	# Home-manager:
	# nix = {
	# 	package = pkgs.nix;
	#   nix.settings.experimental-features = [ "nix-command" "flakes" ];
	# }; 
}
