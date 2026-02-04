{ pkgs, ... }:

{
	nixpkgs.config = {
    		permittedInsecurePackages = ["python-2.7.18.8" "electron-25.9.0"];
  	};

	environment.systemPackages = with pkgs; [
				# core
				android-tools     # Android adb tool. Can be used to connect to itself via wireless debugging.
    		binwalk            # Can analyze files for other files inside them.
    		btop htop          # System monitors.

				# C/C++ packages
				clang # Компилятор
        clang-tools
        cmake
        cppcheck # Static analysis tool for C/C++ code

				curl               # CLI http client.
    		coreutils usbutils # Common utilities.
    		fastfetch          # Systeminfo summary.
				neofetch					 # Systeminfo summary.
				neovim # Text editor.
    		ffmpeg             # Video/audio converter.
    		file               # Get general info about a file.
				fzf								 # Command-line fuzzy finder written in Go
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
				openssh						 # Ssh client.
				openssl 					 # Cryptography tools.
    		parallel           # Run programs in parallel.
    		zip unzip          # Zip archive/unarchive tools.
    		smartmontools      # S.M.A.R.T. tools.
    		sqlite             # Serverless file-based database engine.
    		tree               # Show directory stricture as a tree.
				tcpdump # Sniff tool.
      	tmux # Terminal multiplexor.
      	transmission_4 # Torrent client.
        util-linux # Common Linux utilities.

    		#ventoy             # Boot multiple ISO/images from a single USB stick.
    		wget               # CLI http download tool.
    		git

				wireguard-tools
    		networkmanager
    		home-manager
    		neovim 	
				xray
				zmap				
				bat # cat alternative
				tldr #Simplified and community-driven man pages
				navi

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
    		sway # Sway WM.
				#swayfx # Fork of Sway with extra option and effects
    		waybar # Sway bar.

				ags # standalone widget system or waybar
				mpvpaper # Video wallpapers.

				# Themes
				catppuccin-sddm
				gtk4
				catppuccin-cursors # Mouse cursor theme
        catppuccin-papirus-folders # Icon theme, e.g. for pcmanfm-qt
        papirus-folders # For the catppucing stuff work

				# Common
				evince	# Document viewer.

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

				lmstudio # LM Studio is an easy to use desktop app for experimenting with local LLMs
				# gnome extensions
				# gnome-shell-extension
  ];

	services.displayManager.sddm = {
  	enable = true;
  	theme = "catppuccin-mocha";
  	package = pkgs.kdePackages.sddm;
	};
	
	programs = {
				zsh.enable			 = true;
				xwayland.enable  = true;
				firefox.enable   = true;
				waybar.enable    = false;
	};
}
