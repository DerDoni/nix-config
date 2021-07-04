{ config, lib, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.networkmanager.packages = with pkgs; [
    networkmanager_fortisslvpn
    networkmanager_openvpn
  ];
  environment.etc."resolv.conf" = with lib;
    with pkgs; {
      source = writeText "resolv.conf" ''
        ${concatStringsSep "\n"
        (map (ns: "nameserver ${ns}") config.networking.nameservers)}
        options edns0
      '';
    };
  environment.systemPackages = with pkgs; [ openfortivpn ];
  networking.nameservers = [ "1.1.1.1" ];

}
