{
  pkgs,
  ...
}:
{
  programs.git = {
    enable = true;
    userName  = "Norsion";
    userEmail = "infaer.res@yandex.ru";

    delta = {
      enable = true;
    };

    extraConfig = {
      branch.sort = "-committerdate"; # Sort branches by recent commits.
      tag.sort = "version:refname"; # Sort tags by time.
      init.defaultBranch = "master";
      color.ui = "auto";
      diff = {
        algorithm = "histogram"; # Use histogram algo for better visual comparison.
        colorMoved = "plain"; # Better difference between moved and added code.
        mnemonicprefix = true;
        renames = true; # Detect file renames.
      };
      fetch = {
        all = true; # Fetch everything.
        prune = true; # Prune stuff that's gone.
      };
      merge.tool = "delta";

      aliases = {
        a = "add";
        co = "checkout";
      };
    };
  };
}
