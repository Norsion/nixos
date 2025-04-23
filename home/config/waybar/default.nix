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
        margin-top = 7;
        margin-bottom = 0;
        margin-left = 448;
        margin-right = 448;

        modules-left = [
            "sway/workspaces"
        ];
        modules-center = [
            "group/datetime" 
        ];
        modules-right = [ 
            "sway/language" 
            "pulseaudio"
            "privacy"
            "group/hardware"
            "network" 
            "custom/notification"
        ];

                
        "sway/workspaces" = {
            all-outputs = true;
            disable-scroll = true;
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

        "clock#time" = {
            format = "󰥔 {:%H:%M}";
            #on-click = "thunderbird";
            tooltip-format = "<big><tt>{calendar}</tt></big>";
        };
        "clock#date" = {
            format = "{:%a %d}";
            on-click = "thunderbird";
            tooltip-format = "<big><tt>{calendar}</tt></big>";
        };

        # Pulseaudio
        pulseaudio = {
            format = "{volume} {icon} / {format_source}";
            format-source = "󰍬";
            format-source-muted = "󰍭";
            format-muted = "󰖁 / {format_source}";
            format-icons = {
              default = [
                "󰕿"
                "󰖀"
                "󰕾"
              ];
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
            format-wifi = "{icon}";
            format-ethernet = "󰈀"; # 󰈁
            format-disconnected = "⚠";
            tooltip-format-wifi =  "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n {bandwidthUpBits}  {bandwidthDownBits}";
            tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n {bandwidthUpBits}  {bandwidthDownBits}";
            tooltip-format-disconnected = "Disconnected";
            format-alt = "  {ifname}";
            on-click = "${pkgs.networkmanagerapplet}/bin/nm-connection-editor";
            interval = 5;
        };

        memory = {
            format = "{percentage}%";
            interval = 2;
            on-click = "foot -e bash -c btop";
            on-click-right = "powersave toggle";
            states.critical = 80;
        };


        "cpu#usage" = {
            format = "{usage}%";
            interval = 2;
            on-click = "foot -e btop";
            states.critical = 100;
            tooltip = false;
        };
        "cpu#load" = {
            format = "({load})";
            interval = 2;
            on-click = "foot -e btop";
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
                "cpu#usage"
                "cpu#load"
                "temperature"
                "memory"
            ];
        };

        "group/datetime" = {
            orientation = "horizontal";
            modules = [
                "clock#time"
                "clock#date"
            ];
        };

      };
    };

    style = lib.mkAfter ''
        ${builtins.readFile "${self}/home/config/waybar/style.css"}
      '';
  };
}

