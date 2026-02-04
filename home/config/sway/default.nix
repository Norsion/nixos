{ pkgs, 
	lib,
  config,
	... 
}:
let 

	color = "#ffffff";
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
	selection = "slurp -d -b ${color}26 -c ${color} -w 0 -s 00000000";
	format = "%Y-%m-%d_%H-%M-%S";

	notifyEnd = ''swayscript notify-stop'';
  notifyStart = ''swayscript notify-start'';

  optipng = ''optipng -o1 "''${scrFile}"'';
	picEdit = ''swappy -f - -o -'';
  picFull = ''-o $(swaymsg -t get_outputs | jq -r ".[] | select(.focused) | .name") -'';
	picSelected = ''-g "''${scrSelection}" -'';
	picToBuffer = ''wl-copy -t image/png'';
  picToFile = ''tee "''${scrFile}"'';
	picPrepFile = prepFile "\$HOME/image" "png";
	picRefLatestFile = refLatestFile "png";
  screenshot = ''grim'';
  selectStop = ''pkill -SIGINT slurp'';

	getSelection = ''
    scrSelection=$(${selection})
    [[ -n "''${scrSelection}" ]] || exit
  '';

 refLatestFile = ext: ''
    scrLatest="''${scrPath}/latest.${ext}"
    rm "''${scrLatest}"
    ln -s "''${scrLatestRef}" "''${scrLatest}"
  '';

	prepFile = path: ext: ''
    # Focused app id by default.
    curWindow=$(printf "%s" $(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .app_id') | parse-filename)

    # If no id (i.e. xwayland), then use a name (title).
    [[ "''${curWindow}" = "null" ]] && curWindow=$(printf "%s" $(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .name') | parse-filename)

    # If no app in focus, use "unknown" dir.
    [[ "''${curWindow}" =~ ^[0-9]+$ ]] && curWindow="unknown"

    # Prepare dir and file path.
    scrPath="${path}"
    scrDir="${path}/''${curWindow}"
    mkdir -p "''${scrDir}"
    scrName="$(date +${format}).${ext}"
    scrFile="''${scrDir}/''${scrName}"
    scrLatestRef="./''${curWindow}/''${scrName}"
  '';
  
	SelectScreenshot =
    pkgs.writeShellScriptBin "select-screenshot" ''
      ${selectStop} || {
        ${getSelection}
        ${notifyStart}
        ${picPrepFile}

        ${screenshot} ${picSelected} | ${picEdit} | ${picToFile} | ${picToBuffer}
        ${notifyEnd}
        ${optipng}
        ${picRefLatestFile}
      };
    '';


in 
{
	#appLauncher = "${pkgs.wofi}/bin/wofi --show drun";
	#audioControl      = "${pkgs.pulseaudio}/bin/pactl";


	wayland.windowManager.sway = {
			enable = true;
			package = pkgs.sway;
			#package = pkgs.swayfx;
			#checkConfig = false;
			wrapperFeatures.gtk = true;
			systemd.enable = true;
			xwayland = true;

			/* extraConfig = ''
			${
        if config.wayland.windowManager.sway.package == pkgs.swayfx
        then "
        shadows enable
				shadows_on_csd enable
				shadow_blur_radius 50
				shadow_color #0000007F
				corner_radius 10
				blur disable
				titlebar_separator disable
				set $border_width 0
				"
        else ""
      }
			''; */

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
					# Screenshot
					#"${super}+v" = "exec ${SelectScreenshot}";

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
					outer = 0;
					inner = 10;
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
					#{ command = "${pkgs.swayfx}/bin/swaymsg 'workspace 1; exec ${pkgs.foot}/bin/foot'"; }
					{ command = "${pkgs.sway}/bin/swaymsg 'workspace 1; exec ${pkgs.foot}/bin/foot'"; }
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

