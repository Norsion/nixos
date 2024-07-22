{ config, lib, pkgs, setting, ...}:

{
	boot = {
		loader = {
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint     = "/boot";
			};
			systemd-boot = {		# systemd-boot options
				enable = true;		# toggle for enabling systemd-boot	
			};
		};
	};
}
