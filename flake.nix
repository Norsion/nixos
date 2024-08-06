{
	description = "My system configuragion";

	inputs = {
		# Core system.
		# Homepage: https://github.com/NixOS/nixpkgs
		# Manual:   https://nixos.org/manual/nixos/stable
		# Search:   https://search.nixos.org/packages and https://search.nixos.org/options
		nixpkgs.url 			= "github:nixos/nixpkgs/nixos-unstable";
		#nixpkgsStable.url = "github:nixos/nixpkgs/nixos-24.05";

		# This thing manages user's /home directroies. Because NixOS only manages system itself.
		# Homepage: https://github.com/nix-community/home-manager
		# Manual:   https://nix-community.github.io/home-manager
		# Search:   https://home-manager-options.extranix.com
		home-manager = {
			url = "github:nix-community/home-manager";

			# This means that home-manager and our Flake both depend on the same nixpkgs version.
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# This allows automatic styling based on active Wallpaper.
		# Homepage: https://github.com/danth/stylix
		# Manual:   https://danth.github.io/stylix
		#stylix.url  = "github:danth/stylix";

	};
	outputs = { 
		nixpkgs,
		#nixpkgsStable,
		home-manager, 
		#stylix,
		... 
	} @inputs:
			let
				system = "x86_64-linux";
				username = "hitonoe";
        hostname = "nixos";
			in {
      
			  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				  inherit system;
					specialArgs = { 
            inherit username; inherit hostname;
          };
				  modules = [ 
						./module/configuration.nix 
						home-manager.nixosModules.home-manager
					];
			  };

			  homeConfigurations.hitonoe = home-manager.lib.homeManagerConfiguration {
				  pkgs = nixpkgs.legacyPackages.${system};
					extraSpecialArgs = {
            inherit username; inherit hostname;
          };
				  modules = [ 
						./home/home.nix
				  ];
			  };
		  };
}
