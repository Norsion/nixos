{ pkgs, ... }:
{
    services = {
        displayManager = {
            sddm = {
                enable = true;        # toggle for SDDM  
                #theme  = "${pkgs.sddm-astronaut}/share/sddm/themes/astronaut";
            };

            autoLogin.enable = false;       # autologin, for security purposes i DO NOT recommend toggle it
        };
        xserver = {
            displayManager = {
                gdm.enable = false;         # toggle for GDM
                #wayland.enable = true;
           }; 
        };
    };
}
