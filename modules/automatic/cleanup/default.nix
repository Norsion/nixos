{ pkgs, lib, ... }:
{
  # Manual:
  # The Nix store accumulates entries which are no longer useful.
  # They can be deleted with nix-collect-garbage or "nix-store --gc".
  # "nix-collect-garbage -d" operates only for the current user. 
  # To clear system profiles, run it with root privileges.

  # Automatic cleanup;
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;
}