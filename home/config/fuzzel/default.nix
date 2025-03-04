{ lib, config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        lines = 20;
        prompt = "\"\"";
        show-actions = "yes";
        terminal = "foot";
        width = 40;
      };
      border = {
        radius = 0;
        width = 1;
      };
      #colors = {
      #  background = "ffffffff";
      #  #background = config.module.style.color.bg.dark + config.module.style.opacity.hex;
      #  border = "fffffffa";
      #  #counter = config.module.style.color.bg.regular + defaultOpacity;
      #  #input = config.module.style.color.fg.light + defaultOpacity;
      #  #match = config.module.style.color.fg.light + defaultOpacity;
      #  #placeholder = config.module.style.color.bg.regular + defaultOpacity;
      #  #prompt = config.module.style.color.fg.light + defaultOpacity;
      #  selection = "3d4474fa";
      #  #selection-match = config.module.style.color.accent + defaultOpacity;
      #  #selection-text = config.module.style.color.fg.light + defaultOpacity;
      #  #text = config.module.style.color.fg.light + defaultOpacity;
      #};
    };
  };
}
