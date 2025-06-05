{
  programs.git = {
    enable = true;
    userName  = "Norsion";
    userEmail = "infaer.res@yandex.ru";

    delta = {
      enable = true;
    };

    extraConfig = {
      init.defaultBranch = "master";
      color.ui = "auto";
      diff = {
        tool = "delta";
        mnemonicprefix = true;
      };
      merge.tool = "delta";

      aliases = {
        a = "add";
        co = "checkout";
      };
    };
  };
}
