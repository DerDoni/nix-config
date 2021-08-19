{ config, pkgs, ... }:

{
  imports = [
    ./modules/hardware/dracula.nix
    ./modules/fonts.nix
    ./modules/networking.nix
    ./modules/overlays.nix
    ./modules/xmonad.nix
    ./modules/email.nix
    ./modules/variables.nix
    ./modules/packages.nix
    ./modules/services.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nixpkgs.config.allowUnfree = true;
  home-manager.users.vincenzo = import ./home.nix;
  time.timeZone = "Europe/Berlin";

  #  services.xserver.desktopManager.plasma5.enable = true;
  hardware.opengl.driSupport32Bit = true;
  networking = {
    hostName = "dracula";
    useDHCP = false;
    interfaces.enp42s0.useDHCP = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      RANGER_LOAD_DEFAULT_RC = "false";
      CONFIGURATION_PATH = "$HOME/nix-config/configuration.nix";
      PKG_CONFIG_PATH =
        "/nix/store/v08a5vibyhh3j40nc2zvdjhzp2rmh297-zeromq-4.3.4/lib/pkgconfig/";
    };
    shellAliases = import ./modules/aliases.nix;
  };

  users.users.vincenzo = {
    isNormalUser = true;
    initialPassword = "password";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "docker" "audio" ];
  };
  virtualisation.docker.enable = true;

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "21.05";
  };

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    nixPath = [
      "nixos-config=/home/vincenzo/nix-config/configuration.nix"
      "nixpkgs=$HOME/nix-config/nixpkgs"
    ];
    trustedUsers = [ "root" "vincenzo" ];
  };
}
