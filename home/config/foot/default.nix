{ lib, ... }:
{
    programs.foot = {
        enable = true;
        server.enable = true;

        settings = {
            main = {
                term = "xterm-256color";
                font = lib.mkForce "Noto Mono:size=13";
                workers = 32;
                initial-window-size-chars = "115x24";
                pad = "12x12 center";
            };

            mouse = {
                hide-when-typing = "no";
            };

            key-bindings = {
                clipboard-copy = "Control+c XF86Copy";
                clipboard-paste = "Control+v XF86Paste";
            };

            text-bindings = {
                "\\x03" = "Control+Shift+c Control+Shift+C";
            };
            
            #colors = {
            #    alpha      = 0.85;
            #    foreground = "d9e0ee";
            #    background = "292a37";
            #   ## Normal/regular colors (color palette 0-7)
            #    regular0="303241";  # black
            #    regular1="ec6a88";
            #    regular2="3fdaa4";
            #    regular3="efb993";
            #    regular4="3fc6de";
            #    regular5="b771dc";
            #    regular6="6be6e6";
            #    regular7="d9e0ee";

            #    bright0="393a4d"; # bright black
            #    bright1="e95678"; # bright red
            #    bright2="29d398";# bright green
            #    bright3="efb993";# bright yellow
            #    bright4="26bbd9";
            #    bright5="b072d1";# bright magenta
            #    bright6="59e3e3";# bright cyan
            #    bright7="d9e0ee";# bright white
            #};
        };
    };
}
