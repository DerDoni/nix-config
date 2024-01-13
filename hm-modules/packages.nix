{ config, lib, pkgs, ... }:

{

  home.packages = with pkgs; [
    exercism
    ranger

    # utils
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq

    mathpix-snipping-tool
    pferd
    neofetch

    sxiv
    mpv
    # productivity
    glow # markdown previewer in terminal
    zathura
    anki
    # communication
    telegram-desktop
    discord
    thunderbirdPackages.thunderbird-115
    slack
    signal-desktop
    chromium
    teams-for-linux

    zotero
  ];

}
