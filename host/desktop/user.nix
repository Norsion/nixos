{
    imports = [ ../../home/home.nix ];
    config = {
        # gui
        firefox.enable  = true;
        foot.enable     = true;
        stylix.enable   = true;
        #eww.enable     = true;
        #dunst.enable   = true;
				waybar.enable  = true;
        #wofi.enable     = true;

        # cli
        nvim.enable   = true;
        zsh.enable    = true;
        git.enable    = true;
        #gpg.enable    = true;
        #direnv.enable = true;

        # system
        xdg.enable      = true;
        packages.enable = true;
    };
}
