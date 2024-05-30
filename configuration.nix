# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, setting, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Saratov";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
	LC_ADDRESS        = "ru_RU.UTF-8";
	LC_IDENTIFICATION = "ru_RU.UTF-8";
	LC_MEASUREMENT    = "ru_RU.UTF-8";
	LC_MONETARY       = "ru_RU.UTF-8";
	LC_NAME           = "ru_RU.UTF-8";
	LC_PAPER          = "ru_RU.UTF-8";
	LC_TELEPHONE      = "ru_RU.UTF-8";
  };

  i18n.supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ru_RU.UTF-8/UTF-8"
    ];

  console = {
    font = "cyr-sun16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11
  services.xserver.xkb.layout = "us,ru";
  services.xserver.xkb.model = "pc105";
  services.xserver.xkb.options = "grp:alt_shift_toggle";

  # Gnome DE and GTK apps configuration.
  programs.dconf.enable = true;
  programs.dconf.profiles.user = {
	enableUserDb = true; # Delete `~/.config/dconf/user` to reset user settings.
	databases = [{ 
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

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hitonoe = {
    isNormalUser = true;
    home = "/home/hitonoe";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  security.sudo.enable = true;

  # Allow members of the "wheel" group to sudo:
  security.sudo.configFile = ''
    %wheel ALL=(ALL) ALL
  '';

  nixpkgs.config.allowUnfree = true; 
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    binwalk            # Can analyze files for other files inside them.
    btop htop          # System monitors.
    coreutils usbutils # Common utilities.
    fastfetch          # Systeminfo summary.
    ffmpeg             # Video/audio converter.
    file               # Get general info about a file.
    gcc                # C compiler.
    gdu                # TUI storage analyzer.
    gnumake gnused     # GNU utils.
    gparted parted     # GUI/CLI disk partition tool.
    imagemagick        # Image converter and transformation tool.
    jq                 # Json parser.
    lm_sensors         # Hardware sensors, like temperature and fan speeds.
    lshw               # Detailed hardware info tool.
    lsof               # Find current file users.
    nmap               # Network analyzer.
    parallel           # Run programs in parallel.
    zip unzip          # Zip archive/unarchive tools.
    smartmontools      # S.M.A.R.T. tools.
    sqlite             # Serverless file-based database engine.
    tree               # Show directory stricture as a tree.
    ventoy             # Boot multiple ISO/images from a single USB stick.
    wget               # CLI http download tool.
    git
    curl               # CLI http client.
    networkmanager
    home-manager
    neovim
    firefox
  ];

  # Special packages.
  programs.adb.enable     = true;
  programs.java.enable    = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic =true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

