{ config, pkgs, ... }:

{
 location = {
    latitude = 49.782959;
    longitude = 7.651180;
  };

 
  environment.systemPackages = [
    pkgs.redshift
  ];

  services.redshift = {
    enable = true;
  };
}
 
