{ pkgs, lib, ... }:
{
  # Automatic updating
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
}