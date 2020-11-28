{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  home.file.".config/nixpkgs/config.nix".text = ''
    { allowUnfree = true; }
  '';

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vincenzo";
  home.homeDirectory = "/home/vincenzo";

  home.packages = with pkgs; [
    niv

    # Archiving
    unrar
    unzip
    xz
    zip

    # System Utils
    flameshot
    htop
    rsync
    tree
    ripgrep
    starship
    wget
    direnv
    fd
    file
    fzf
    gvfs
    gitAndTools.gitFull
    xdg_utils
    aspell
    aspellDicts.en
    sshfs
    ledger
    alacritty
    rxvt_unicode
    xorg.xkill
    killall
    gparted
    binutils
    ranger
    pcmanfm
    xdotool
    ueberzug
    lynx
    silver-searcher
    xz
    libimobiledevice
    usbmuxd
    ifuse
    usbutils
    exfat
    dosfstools
    hueadm

    # Code
    vim
    neovim
    coreutils
    nodePackages.npm
    graphviz
    shellcheck
    zeal
    python38Full
    # Python
    black
    pipenv
    # Nix
    nixfmt
    # Haskell
    ghc
    cabal2nix
    cabal-install
    hlint
    haskell-language-server
    # C
    cmake
    gnumake
    gcc
    libtool
    libvterm

    # Research
    calibre
    proselint
    zotero
    texlive.combined.scheme-full
    zathura

    # Apps
    anki
    spotify
    brave
    bitwarden
    bitwarden-cli
    discord
    darktable
    signal-desktop
    signal-cli
    transmission-gtk

    # Window Manager Stuff
    xmobar
    nitrogen
    picom
    trayer
    volumeicon

    # Media
    mpv
    ncmpcpp
    mpd
    sxiv
    exiftool

    # Mail and Calendar
    isync
    msmtp
    notmuch
    khal
    vdirsyncer
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacsGcc;
  };

  services.emacs.enable = true;
  programs.firefox.enable = true;
  programs.neovim.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
