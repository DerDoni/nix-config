{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
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
    borgbackup.jobs.home = {
      paths = [ "/home" ];
      exclude = [ "*/Cache" ".cache" ];
      repo = "/backup/borg/";
      encryption.mode = "none";
      compression = "auto,lzma";
      startAt = "daily";
      environment = { BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK = "yes"; };
    };

    udisks2.enable = true;
    printing.enable = true;
    printing.drivers = [ pkgs.hplip ];
    openssh.enable = true;
    openvpn.servers = {
      uniVPN = { config = " config /home/vincenzo/.config/VPN/kit.ovpn"; };
      nordVPN = { config = " config /home/vincenzo/.config/VPN/nord.ovpn"; };
    };
    emacs.enable = true;

    redshift.enable = true;
  };
}
