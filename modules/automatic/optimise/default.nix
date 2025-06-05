{ pkgs, lib, ... }:
{
  # Manulal:
  # Run "nix-store --optimise". This is a potentially long operation.

  # Automatic optimise;

  # This settings optimise the store during every build
  nix.settings.auto-optimise-store = true;

  # Alternatively:
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Optional; allows customizing optimisation schedule
  # nix.settings.experimental-features = [ "nix-command" "flakes" ];
}