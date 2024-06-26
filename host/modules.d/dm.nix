{
    services = {
        displayManager = {
            sddm.enable      = false;            # toggle for SDDM  
            autoLogin.enable = false;       # autologin, for security purposes i DO NOT recommend toggle it
        };
        xserver = {
            displayManager = {
                gdm.enable = true;         # toggle for GDM
            }; 
        };
    };
}
