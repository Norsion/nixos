{ pkgs, ... }:

{
	nixpkgs.config = {
    		permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  	};

	environment.systemPackages = with pkgs; [
				# core
				android-tools     # Android adb tool. Can be used to connect to itself via wireless debugging.
    		vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    		binwalk            # Can analyze files for other files inside them.
    		btop htop          # System monitors.
    		coreutils usbutils # Common utilities.
    		fastfetch          # Systeminfo summary.
				neofetch					 # Systeminfo summary.
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
				wireguard-tools
    		networkmanager
    		home-manager
    		neovim 	
				xray
				utillinux
				zmap				
				eza #modern alternative for the venerable file-listing command-line program ls
				bat # cat alternative

				# Desktop apps
    		firefox # Was best browser... 
				librewolf
				obsidian	# md editor 
				foot # terminal emulator
				vial	# keyboard settings
				fuzzel # Application launcher.
				grim # Screenshots.
    		slurp # Screen selection.
    		wf-recorder # Screen recording.
    		swappy # Screenshot editing.
				mako # mako  is a "notification daemon," which creates little floating popups when you receive messages.
    		networkmanagerapplet # Internet configuration.
    		pamixer # Sound controls.
    		pavucontrol # Sound applet.
    		pulseaudio # Audio.
    		playerctl # Multimedia controls.
    		#sway # Sway WM.
				swayfx # Fork of Sway with extra option and effects
    		waybar # Sway bar.
				eww # standalone widget system or waybar
				mpvpaper # Video wallpapers.

				catppuccin-cursors # Mouse cursor theme
        catppuccin-papirus-folders # Icon theme, e.g. for pcmanfm-qt
        papirus-folders # For the catppucing stuff work

				# Common
				evince	# Document viewer.

				# Job apps
				openvpn

				# Dev apps
				android-studio
				jetbrains.idea-community

				#misc
				vscodium								# By the time you set up nvim, you will die of old age
				nixd
				nix-tree

				# Xorg stuff
				xclip												# Tool to access the X clipboard from a console application

				# Wayland stuff
    		#xwayland										# X server for interfacing X11 apps with the Wayland protocol
    		wl-clipboard									# Command-line copy/paste utilities for Wayland
    		cliphist							# Wayland clipboard manager https://github.com/sentriz/cliphist
				wpaperd							# Minimal wallpaper daemon for Wayland (on rust xD)

	      # WMs and stuff
				dunst												# Lightweight and customizable notification daemon
    		seatd
			
			  # other
    		tor-browser # Privacy browser.
    		universal-android-debloater # Debloat Android devices.
				jan

				# gnome extensions
				# gnome-shell-extensions
				
				catppuccin-sddm
  ];

	services.displayManager.sddm = {
  	enable = true;
  	theme = "catppuccin-mocha";
  	package = pkgs.kdePackages.sddm;
	};
	
	programs = {
				zsh.enable			= true;
				xwayland.enable = true;
				firefox.enable  = true;
				waybar.enable   = true;
	};
}
