{
	home = {
		username = "hitonoe";
		homeDirectory = "/home/hitonoe";
		stateVersion = "24.05";

		#packages = with pkgs; [
		#	neofetch
		#];
	};
	
	imports = [
		./home.d/bundle.nix
	];

	#programs.neovim = {
	#	enable = true;
	#	defaultEditor = true;
	#	plugins = with pkgs.vimPlugins; [
	#		gruvbox-material
	#		nerdtree
	#	];
	#};
}
