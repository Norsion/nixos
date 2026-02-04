{
	description = "My system configuragion"; # description is a string describing the flake.

  # inputs is an attribute set of all the dependencies of the flake.
	inputs = {
		# Core system.
		# Homepage: https://github.com/NixOS/nixpkgs
		# Manual:   https://nixos.org/manual/nixos/stable
		# Search:   https://search.nixos.org/packages and https://search.nixos.org/options
		nixpkgsUnstable.url 			= "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

		# This thing manages user's /home directroies. Because NixOS only manages system itself.
		# Homepage: https://github.com/nix-community/home-manager
		# Manual:   https://nix-community.github.io/home-manager
		# Search:   https://home-manager-options.extranix.com
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";

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
      url = "github:danth/stylix/release-25.11";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };

		textfox.url = "github:adriankarlen/textfox";

		astal.url = "github:aylur/astal";

		ags.url = "github:Aylur/ags";
	};
	
	# outputs is a function of one argument that takes an attribute set of all the realized inputs, 
	# and outputs another attribute set 
	outputs = { 
		self, 
		nixpkgs,
		nixpkgsUnstable,
		home-manager,
		stylix,
		textfox,
		... 
	} @inputs:
			let
				system   = "x86_64-linux";
				username = "hitonoe";
        hostname = "nixos";
			in {
      
				# This is the section of the `flake.nix` that is responsible for importing and configuring the `configuration.nix`
			  nixosConfigurations = {
					nixos = nixpkgs.lib.nixosSystem {
						# `inherit` is used to pass the variables set in the above "let" statement into our configuration.nix file below
				  	inherit system;
						specialArgs = { 
            	inherit username; 
							inherit hostname; 
							inherit self;
          	};

        		# Our main nixos configuration file
        		# This is the file where we compartmentalize the changes we want to make on a system level

						# Modules are files combined by NixOS to produce the full system configuration. 
						# A module contains a Nix expression. 
						# It declares options for other modules to define (give a value). 
						# It processes them and defines options declared in other modules.
				  	modules = [ 
							./modules/configuration.nix # it uses ./configuration.nix as a module
							home-manager.nixosModules.home-manager
							stylix.nixosModules.stylix
						];
			  	};
				};

				# Standalone home-manager installations
				# Available through 'home-manager --flake.
			  homeConfigurations = {
					hitonoe = home-manager.lib.homeManagerConfiguration {
						# Home-manager requires 'pkgs' instance
				  	pkgs = nixpkgs.legacyPackages.${system}; 
						extraSpecialArgs = {
							# `inherit` is used to pass the variables set in the above "let" statement into our home.nix file below
            	inherit username; 
							inherit hostname; 
							inherit inputs; 
							inherit self;
          	};
						# > Our main home-manager configuration file <
				  	modules = [ 
							./home/home.nix
							stylix.homeManagerModules.stylix
							textfox.homeManagerModules.default
				  	];
			  	};
				};
		  };
}
