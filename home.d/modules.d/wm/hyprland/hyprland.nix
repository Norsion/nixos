{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";

      monitor = ",preferred,auto,1";

     # env = [
     #   "XDG_CURRENT_DESKTOP,Hyprland"
     #   "XDG_SESSION_TYPE,wayland"
     #   "XDG_SESSION_DESKTOP,Hyprland"
     #   "XCURSOR_SIZE,36"
     #   "QT_QPA_PLATFORM,wayland"
     #   "XDG_SCREENSHOTS_DIR,~/screens"
     # ];

     # debug = {
     #   disable_logs = false;
     #   enable_stdout_logs = true;
     # };

      input = {
        kb_layout = "us,ru";
        kb_variant = "lang";
        kb_options = "grp:alt_shift_toggle";

        follow_mouse = 1;

        # touchpad = {
         # natural_scroll = false;
        # };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      # general = {
        # gaps_in = 5;
        # gaps_out = 20;
        # border_size = 3;
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";

        # layout = "dwindle";

        # no_cursor_warps = false;
      # };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 16;
          passes = 2;
          new_optimizations = true;
        };

        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      #dwindle = {
      #  pseudotile = true; # master switch for pseudotiling. Enabling is bound to mod + P in the keybinds section below
       # preserve_split = true; # you probably want this
      #};

      #master = {
       # new_is_master = true;
      #};

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      windowrule = [
        "float, ^(imv)$"
        "float, ^(mpv)$"
      ];

      #exec-once = [
      #  "swww init"
      #  "swww img ~/Downloads/nixos-chan.png"
      #  "waybar"
      #  "wl-paste --type text --watch cliphist store"
      #  "wl-paste --type image --watch cliphist store"
      #];

      bind = [
        "$mod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"

        "$mod, Return, exec, alacritty"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, firefox"
        "$mod, F, togglefloating,"
        "$mod, D, exec, wofi --show drun"
        "$mod, P, pseudo, # dwindle"
        "$mod, J, togglesplit, # dwindle"

        # Move focus with mod + arrow keys
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"

        # Moving windows
        "$mod SHIFT, left,  swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up,    swapwindow, u"
        "$mod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mod CTRL, left,  resizeactive, -60 0"
        "$mod CTRL, right, resizeactive,  60 0"
        "$mod CTRL, up,    resizeactive,  0 -60"
        "$mod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # Keyboard backlight
        "$mod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        "$mod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"

        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

        # Configuration files
        ''$mod SHIFT, N, exec, alacritty -e sh -c "rb"''
        ''$mod SHIFT, C, exec, alacritty -e sh -c "conf"''
        ''$mod SHIFT, H, exec, alacritty -e sh -c "nvim ~/nix/home.d/modules.d/wm/hyprland.nix"''
        ''$mod SHIFT, W, exec, alacritty -e sh -c "nvim ~/nix/home.d/modules.d/wm/waybar.nix''
        '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        # Waybar
        "$mod, B, exec, pkill -SIGUSR1 waybar"
        "$mod, W, exec, pkill -SIGUSR2 waybar"

      ];

      # Move/resize windows with mod + LMB/RMB and dragging
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
