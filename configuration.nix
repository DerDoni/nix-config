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
  boot.kernelPackages = pkgs.linuxPackages_latest;
  nixpkgs.config.allowUnfree = true;

  powerManagement.enable = true;
  time.timeZone = "Europe/Berlin";

  networking = {
    hostName = "dracula"; # Define your hostname.
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
      #      desktopManager.plasma5.enable = true;
      exportConfiguration = true;
      displayManager.lightdm.enable = true;
      displayManager.autoLogin.user = "vincenzo";
      displayManager.autoLogin.enable = true;
      videoDrivers = [ "nvidia" ];
      layout = "us, de";
      xkbOptions = "caps:super, eurosign:e, grp:alt_shift_toggle";
    };
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
          type "pulse" # MPD must use Pulseaudio
          name "Pulseaudio" # Whatever you want
          server "127.0.0.1" # MPD must connect to the local sound server
        }
      '';
    };

    syncthing = {
      enable = true;
      user = "vincenzo";
      dataDir = "/home/vincenzo/Documents";
      configDir = "/home/vincenzo/.config/syncthing";
    };
    cron = {
      enable = true;
      systemCronJobs = [
        "@hourly vincenzo mbsync -a"
        "@hourly vincenzo notmuch new"
        "@weekly vincenzo youtube-dl PLlrATfBNZ98dudnM48yfGUldqGD0S4FFb"
        "@weekly vincenzo youtube-dl PLs3KjaCtOwSZ2tbuV1hx8Xz-rFZTan2J1"
        "@daily vincenzo youtube-dl https://www.youtube.com/c/WhatIveLearned/videos"
      ];
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
    EDITOR = "nvim";
    RANGER_LOAD_DEFAULT_RC = "false";
  };

  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.java.enable = true;
  nixpkgs.config.permittedInsecurePackages = [ "xpdf-4.02" ];
  users.users.vincenzo = {
    isNormalUser = true;
    initialPassword = "password";
    shell = pkgs.fish;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "21.05"; # Did you read the comment?
  };

  programs.qt5ct.enable = true;
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

    trustedUsers = [ "root" "vincenzo" ];
    nixPath = [ "nixos-config=/home/vincenzo/nix-config/base.nix" ];
  };
}
