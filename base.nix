{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    ./modules/fonts.nix
    ./modules/networking.nix
    ./modules/overlays.nix
    ./modules/xmonad.nix
    ./modules/email.nix
    ./modules/redshift.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Berlin";

  networking = {
    hostName = "nixos"; # Define your hostname.
    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      displayManager.autoLogin.user = "vincenzo";
      displayManager.autoLogin.enable = true;
      videoDrivers = [ "nvidia" ];
      layout = "us";
      xkbOptions = "caps:super";
    };
    udisks2.enable = true;
    printing.enable = true;
    printing.drivers = [ pkgs.hplip ];
    openssh.enable = true;
    openvpn.servers = {
      uniVPN = { config = " config /home/vincenzo/.config/VPN/kit.ovpn"; };
      nordVPN = { config = " config /home/vincenzo/.config/VPN/nord.ovpn"; };
    };
  };

  environment.variables = {
    EDITOR = "emacs";
    RANGER_LOAD_DEFAULT_RC = "false";
  };
  environment.systemPackages = with pkgs;
    [
      (python38.withPackages
        (ps: with ps; [ numpy toolz pillow pytest pandas requests isort ]))
    ];

  nixpkgs.config.permittedInsecurePackages = [ "xpdf-4.02" ];
  users.users.vincenzo = {
    isNormalUser = true;
    initialPassword = "password";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "20.09"; # Did you read the comment?
  };

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    trustedUsers = [ "root" "vincenzo" ];
    nixPath = [
      "nixpkgs=/home/vincenzo/nix-config/nixpkgs"
      "nixos-config=/home/vincenzo/nix-config/base.nix"
      "home-manager=/home/vincenzo/nix-config/home-manager"
    ];
  };
}
