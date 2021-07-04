{ config, lib, pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.java.enable = true;

  programs.qt5ct.enable = true;
  environment.systemPackages = [ pkgs.redshift ];
}
