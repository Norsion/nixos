{
	description = "My system configuragion"; # description is a string describing the flake.

  # inputs is an attribute set of all the dependencies of the flake.
	inputs = {
		# Core system.
		# Homepage: https://github.com/NixOS/nixpkgs
		# Manual:   https://nixos.org/manual/nixos/stable
		# Search:   https://search.nixos.org/packages and https://search.nixos.org/options
		nixpkgsUnstable.url 			= "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

		# This thing manages user's /home directroies. Because NixOS only manages system itself.
		# Homepage: https://github.com/nix-community/home-manager
		# Manual:   https://nix-community.github.io/home-manager
		# Search:   https://home-manager-options.extranix.com
		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";

			# This means that home-manager and our Flake both depend on the same nixpkgs version.
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# SOURCE: https://github.com/LilleAila/nix-cursors
    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		# This allows automatic styling based on active Wallpaper.
		# Homepage: https://github.com/danth/stylix
		# Manual:   https://danth.github.io/stylix
		stylix = {
      url = "github:danth/stylix/release-24.11";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
	};
	
	# outputs is a function of one argument that takes an attribute set of all the realized inputs, 
	# and outputs another attribute set 
	outputs = { 
		self, 
		nixpkgs,
		nixpkgsUnstable,
		home-manager,
		stylix,
		... 
	} @inputs:
			let
				system   = "x86_64-linux";
				username = "hitonoe";
        hostname = "nixos";
			in {
      
			  nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				  inherit system;
					specialArgs = { 
            inherit username; inherit hostname; inherit self;
          };

					# Modules are files combined by NixOS to produce the full system configuration. 
					# A module contains a Nix expression. 
					# It declares options for other modules to define (give a value). 
					# It processes them and defines options declared in other modules.
				  modules = [ 
						./module/configuration.nix              # it uses ./configuration.nix as a module
						home-manager.nixosModules.home-manager
						stylix.nixosModules.stylix
					];
			  };

				# Standalone home-manager installations
			  homeConfigurations.hitonoe = home-manager.lib.homeManagerConfiguration {
				  pkgs = nixpkgs.legacyPackages.${system};
					extraSpecialArgs = {
            inherit username; inherit hostname; inherit inputs; inherit self;
          };
				  modules = [ 
						./home/home.nix
						stylix.homeManagerModules.stylix
				  ];
			  };
		  };
}
