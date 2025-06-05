{ pkgs, ... }:

{
  services = {
	openssh = {                                  # openssh options
            enable    = false;                          # toggle for enabling openssh
            allowSFTP = false;                        # toggle for enabling SFTP
        };
        xserver = {                                  # xserver options
            enable = true;                           # toggle for enabling xserver
            videoDrivers = [ "amdgpu" ];             # drivers module
            excludePackages = [ ];                   # option for excluding some packages from basic xserver
            #synaptics = {
            #    enable = false;
                # about synaptics you'll need read by yourself
            #};
            #wacom = {
            #    enable = false;
                # wacom drivers needed to be configured by yourself
            #};
            xkb = {                                  # xkb options
                layout = "us,ru";                    # layouts
                variant = "pc105";                   # if your keyboard isn't QWERTY - set it here
                options = "grp:alt_shift_toggle";    # switching method for xkb
            };
        };
  };
}
