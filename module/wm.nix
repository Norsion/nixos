# wm and wayland comositors options

{
    programs = {
        hyprland.enable = true;                # toggle for enabling hyprland
        sway.enable     = false;               # toggle for enabling Sway
				xwayland.enable = true;								 # toggle for enabling xwayland (X server that runs under Wayland and prodives compatibility for native X11 apps that are yet to provide Wayland support
		};

    services = {
        xserver = {
            windowManager = {                   # toggles for xorg WMs (i ain't write it all. no )
                awesome.enable = false;
                hypr.enable    = true;
                i3.enable      = false;
            };
        };
    };
}
