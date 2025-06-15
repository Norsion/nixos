{ pkgs, 
	lib,
  config,
	... 
}:
let 
	super = "Mod4";
	workspace1  = "workspace number 1";
  workspace2  = "workspace number 2";
  workspace3  = "workspace number 3";
  workspace4  = "workspace number 4";
	workspace5  = "workspace number 5";
  workspace6  = "workspace number 6";
  workspace7  = "workspace number 7";
  workspace8  = "workspace number 8";
  workspace9  = "workspace number 9";
  workspace10 = "workspace number 10";

	terminal    = "${pkgs.foot}/bin/foot";
	appLauncher = "${pkgs.fuzzel}/bin/fuzzel";
in 
{
	#appLauncher = "${pkgs.wofi}/bin/wofi --show drun";
	#audioControl      = "${pkgs.pulseaudio}/bin/pactl";

	wayland.windowManager.sway = {
			enable = true;
			package = pkgs.swayfx;
			checkConfig = false;
			wrapperFeatures.gtk = true;
			systemd.enable = true;

			extraConfig = ''
			${
        if config.wayland.windowManager.sway.package == pkgs.swayfx
        then "
        blur enable
        blur_passes 1

        corner_radius 10
        shadows enable

        layer_effects launcher blur enable
        layer_effects launcher blur_ignore_transparent enable
        layer_effects swaybar blur enable
        layer_effects swaybar blur_ignore_transparent enable
        layer_effects waybar blur enable
        layer_effects waybar blur_ignore_transparent enable
        layer_effects notifications blur enable
        layer_effects notifications blur_ignore_transparent enable
        layer_effects logout_dialog blur enable
        layer_effects swayosd blur enable
        layer_effects swayosd blur_ignore_transparent enable"
        else ""
      }
			'';

			# Sway-specific Configuration
			config = {
				modifier = super;
				terminal = "foot";
				menu = "fuzzel";

				focus.mouseWarping = "container";

        input = {
          "type:pointer" = {
            accel_profile = "flat";
            pointer_accel = "0.3";
          };

          "type:keyboard" = {
            xkb_layout = "us,ru";
            xkb_options = "grp:alt_shift_toggle";
            repeat_delay = "300";
            repeat_rate = "60";
          };
        };

				keybindings = {
					# Terminal
					"${super}+t" = "exec ${terminal}";

					# Kill active window
        	"${super}+q" = "kill";

					# Application launcher
        	"${super}+d" = "exec ${appLauncher}";

					# Reload the configuration file
					"${super}+Shift+r" = "reload";

					# Fullscreen mode
					"${super}+f" = "fullscreen";

					# Float mode
					"${super}+Space" = "floating toggle";

					# Resize mode
					"${super}+r" = "mode resize";

					# Change focus
					# Vim like
					"${super}+h" = "focus left";
					"${super}+j" = "focus down";
					"${super}+k" = "focus up";
					"${super}+l" = "focus right";

					# Switch to workspace using number row
					"${super}+1" = "${workspace1}";
					"${super}+2" = "${workspace2}";
					"${super}+3" = "${workspace3}";
					"${super}+4" = "${workspace4}";
					"${super}+5" = "${workspace5}";
					"${super}+6" = "${workspace6}";
					"${super}+7" = "${workspace7}";
					"${super}+8" = "${workspace8}";
					"${super}+9" = "${workspace9}";
					"${super}+0" = "${workspace10}";

					# Move window to workspace using number row
					"${super}+Shift+1" = "move container to ${workspace1}";
					"${super}+Shift+2" = "move container to ${workspace2}";
					"${super}+Shift+3" = "move container to ${workspace3}";
					"${super}+Shift+4" = "move container to ${workspace4}";
					"${super}+Shift+5" = "move container to ${workspace5}";
					"${super}+Shift+6" = "move container to ${workspace6}";
					"${super}+Shift+7" = "move container to ${workspace7}";
					"${super}+Shift+8" = "move container to ${workspace8}";
					"${super}+Shift+9" = "move container to ${workspace9}";
					"${super}+Shift+0" = "move container to ${workspace10}";
				};

				modes = {
					resize = {
						# Vim like binds
						"h" = "resize shrink width 10px";
						"j" = "resize shrink height 10px";
						"k" = "resize shrink height 10px";
						"l" = "resize shrink width 10px";

						# Arrows
						"Left" = "resize shrink width 10px";
						"Down" = "resize shrink height 10px";
						"Up" = "resize shrink height 10px";
						"Right" = "resize shrink width 10px";

						# Vim like binds
						"Shift+h" = "resize grow width 10px";
						"Shift+j" = "resize grow height 10px";
						"Shift+k" = "resize grow height 10px";
						"Shift+l" = "resize grow width 10px";

						# Arrows
						"Shift+Left" = "resize grow width 10px";
						"Shift+Down" = "resize grow height 10px";
						"Shift+Up" = "resize grow height 10px";
						"Shift+Right" = "resize grow width 10px";

						# Return to normal mode
						"Escape" = "mode default";
						"Return" = "mode default";
					};
				};
				# Status bar(s)

				bars = [];

				gaps = {
					inner = 7;
				};

				window = { 
					titlebar = false; 
				};
				
				# Display device configuration
				output = {
					eDP-1 = {
						# Set HIDP scale (pixel integer scaling)
            scale = "1";
					};
				};

				startup = [
					#{ command = "foot"; }
					{ command = "${pkgs.swayfx}/bin/swaymsg 'workspace 1; exec ${pkgs.foot}/bin/foot'"; }
				];
			};
		};
		home.packages = with pkgs; [
			swaybg 
			# swayidle is an idle timer.
			# swaylock is a idle screen locker.
			wl-clipboard  # allows you to copy-paste (i.e. a clipboard).
			mako 
		];
}

