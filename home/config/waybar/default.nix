 { self, lib, pkgs, ... }:
 {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    systemd.target = "graphical-session.target";
    
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        exclusive = true;
        fixed-center = true;
        gtk-layer-shell = true;
        spacing = 0;
        margin-top = 10;
        margin-bottom = 0;
        margin-left = 448;
        margin-right = 448;

        modules-left = [
            "sway/workspaces"
            "sway/window"
        ];
        modules-center = [
            "clock" 
        ];
        modules-right = [ 
            "sway/language" 
            "pulseaudio"
            "privacy"
            "group/hardware"
            "network" 
            "custom/notification"
            "tray"
        ];

                
        "sway/workspaces" = {
            all-outputs = true;
            disable-scroll = true;
            active-only = false;
        };
        
        "sway/window" = {
            format = "<span color='#202020' bgcolor='#d3869b' > 󰣆 </span> {app_id}";
            separate-outputs = true;
            icon = false;
        };

        "sway/language" = {
            format = "{}";
            format-en = "US";
            format-ru = "RU";
          };

        "keyboard-state" = {
            #numlock = true;
            capslock = true;
            format = "{icon} ";
            format-icons = {
                locked = " ";
                unlocked = "";
            };
        };

        "clock" = {
            format = "{:%a %d %b %R}";
            format-alt = "{:%I:%M %p}";
            #on-click = "thunderbird";
            tooltip-format = "<big><tt>{calendar}</tt></big>";
            calendar = {
                mode = "month";
                mode-mon-col = 3;
                on-scroll = 1;
                on-click-right = "mode";
                format = {
                  months = "<span color='#ffead3'><b>{}</b></span>";
                  weekdays = "<span color='#ffcc66'><b>{}</b></span>";
                  today = "<span color='#ff6699'><b>{}</b></span>";
                };
              };
              actions = {
                on-click-right = "mode";
                on-click-forward = "tz_up";
                on-click-backward = "tz_down";
                on-scroll-up = "shift_up";
                on-scroll-down = "shift_down";
              };
        };

        # Pulseaudio
        pulseaudio = {
            format = "{volume} {icon} / {format_source}";
            format-source = "󰍬";
            format-source-muted = "󰍭";
            format-muted = "󰖁 / {format_source}";
            format-icons = {
              headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
            };
            on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
            on-click-right = "${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
            on-scroll-up = "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ +1%";
            on-scroll-down = "${pkgs.pulseaudio}/bin/pactl set-sink-volume @DEFAULT_SINK@ -1%";
            tooltip = false;
        };

        # Network
        network = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-wifi = "󰤨 Wi-Fi";
            format-ethernet = "󱘖 Wired";
            format-linked = "󱘖 {ifname} (No IP)";
            format-disconnected = "󰤮 Off";
            tooltip-format-wifi =  "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n {bandwidthUpBits}  {bandwidthDownBits}";
            tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n {bandwidthUpBits}  {bandwidthDownBits}";
            tooltip-format-disconnected = "Disconnected";
            format-alt = "󰤨 {signalStrength}%";
            on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
            interval = 5;
        };

        memory = {
            format = "{percentage}%";
            format-alt = "󰾅 {used}GB";
            interval = 2;
            on-click = "foot -e bash -c btop";
            on-click-right = "powersave toggle";
            states.critical = 80;
        };

        "tray" = {
            icon-size = 12;
            spacing = 5;
        };


        "cpu" = {
            format = "󰍛 {usage}% ({load})";
            format-alt = "{icon0}{icon1}{icon2}{icon3}";
            format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
            interval = 2;
            on-click = "foot -e btop";
            states.critical = 100;
            tooltip = false;
        };

        "temperature" = {
            hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
            critical-threshold = 80;
            # format-critical = "{temperatureC}°C {icon}";
            format = "{temperatureC}°C";
            interval = 2;
            tooltip = false;
        };

        # Privacy
        privacy = {
            icon-size = 15;
        };

        # Notifications
        "custom/notification" = {
            exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
            return-type = "json";
            format = "{icon}";
            on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
            on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
            escape = true;

            format-icons = {
              notification = "󰂚";
              none = "󰂜";
              dnd-notification = "󰂛";
              dnd-none = "󰪑";
              inhibited-notification = "󰂛";
              inhibited-none = "󰪑";
              dnd-inhibited-notification = "󰂛";
              dnd-inhibited-none = "󰪑";
            };
        };

        "group/hardware" = {
            orientation = "horizontal";
            modules = [
                "cpu"
                "temperature"
                "memory"
            ];
        };

      };
    };

    style = lib.mkAfter ''
        ${builtins.readFile "${self}/home/config/waybar/style.css"}
      '';
  };
}

