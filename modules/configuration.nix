{ config, lib, pkgs, setting, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
			../host/desktop/hardware-configuration.nix
			./automatic/cleanup/default.nix
			./automatic/optimise/default.nix
			./boot/default.nix
			./variables.nix
			./de.nix
			./dm.nix
			./packages.nix
			./hardware.nix
			./locales.nix
			./network/default.nix
			./sound.nix
			./stylix/default.nix
			./nix.nix
			./fonts.nix
			./nixpkgs.nix
			./services.nix
			./sway.nix
    ];
	
  #Gnome DE and GTK apps configuration.
  programs.dconf.enable 	= true;
  programs.dconf.profiles.user	= {
	enableUserDb = true; # Delete `~/.config/dconf/user` to reset user settings.
	databases    = [{
		settings = {
			"org/gnome/desktop/input-sources" = with lib.gvariant; {
				current          = mkUint32 0;
				mru-sources      = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
				per-window       = false;
				show-all-sources = true;
				sources          = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
				xkb-options      = [ "grp:alt_shift_toggle" ];
			};
		};
	}];
  };

	fileSystems."/nix" = {
		device		= "/dev/disk/by-label/nix";
		fsType		= "ext4";
		neededForBoot 	= true;
		options 	= [ "noatime" ];
	};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hitonoe = {
		isNormalUser	= true;
		home		= "/home/hitonoe";
		extraGroups	= [ "wheel" ]; # Enable ‘sudo’ for the user.
		shell = pkgs.zsh;
  };

  security.sudo.enable = true;
	security.polkit.enable = true;

  # Allow members of the "wheel" group to sudo:
  security.sudo.configFile = ''
    %wheel ALL=(ALL) ALL
  '';

  # Special packages.
  programs.adb.enable     = true;
  programs.java.enable    = true;

  system.stateVersion = "23.11"; # Don't touch

}

