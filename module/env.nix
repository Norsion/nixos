{ pkgs, ... }:

{
	nixpkgs.config = {
    		permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  	};

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

				# Desktop apps
    		firefox
				obsidian
				alacritty
				foot
				discord

				# Xorg stuff
				xclip

				# Hyprland stuff
				hyprcursor
				hypridle

				# Wayland stuff
    		xwayland
    		wl-clipboard
    		cliphist

	      # WMs and stuff
    		herbstluftwm
    		hyprland
    		seatd
    		xdg-desktop-portal-hyprland
    		polybar
    		waybar

  ];

	programs = {
				zsh.enable			= true;
				xwayland.enable = true;
				firefox.enable  = true;
				waybar.enable   = true;
	};

	fonts.packages = with pkgs; [
    		jetbrains-mono
    		noto-fonts
    		noto-fonts-emoji
    		twemoji-color-font
    		font-awesome
    		powerline-fonts
    		powerline-symbols
    		(nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  	];
}
