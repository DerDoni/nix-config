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
    # Archiving
    unrar
    unzip
    xz
    zip

    # System Utils
    dconf
    borgbackup
    magic-wormhole
    maim
    flameshot
    gnuplot
    libgnome_keyring
    libsecret
    xclip
    ipfs
    jump
    htop
    rsync
    tree
    ripgrep
    nextcloud21
    ripgrep-all
    starship
    wget
    direnv
    fd
    file
    fzf
    p7zip
    gvfs
    gitAndTools.gitFull
    bfg-repo-cleaner
    xdg_utils
    aspell
    aspellDicts.en
    sshfs
    ledger
    alacritty
    rxvt_unicode
    xorg.xkill
    xorg.libXft
    xorg.libXdamage
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
    sqlite
    pavucontrol

    # Code
    exercism
    vim
    coreutils
    nodePackages.npm
    graphviz
    shellcheck
    zeal
    # Python
    python3
    black
    python-language-server
    # Nix
    nixfmt
    # Haskell
    ghc
    cabal2nix
    cabal-install
    hlint
    haskell-language-server
    stack
    # C
    cmake
    gnumake
    gcc
    libtool
    libvterm
    # Java
    jetbrains.idea-ultimate
    openjdk
    maven
    kotlin

    # SWT Tut
    slack

    # Research
    calibre
    proselint
    zotero
    texlive.combined.scheme-full
    zathura
    pandoc

    # Apps
    anki
    brave
    discord
    signal-desktop
    tdesktop
    weechat
    transmission-gtk
    zoom-us
    firefox

    # Window Manager Stuff
    xmobar
    nitrogen
    picom

    # Media
    mpv
    ncmpcpp
    mpd
    mpc_cli
    sxiv
    exiftool
    youtube-dl
    higan
    snes9x-gtk

    # Mail and Calendar
    isync
    msmtp
    notmuch
    mu
    khal
    vdirsyncer
  ];

  programs.emacs = {
    enable = true;
    #  package = pkgs.emacsGcc;
    extraPackages = epkgs: [ epkgs.vterm ];
  };
  programs.neovim.enable = true;
  services.emacs.enable = true;
  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
    font.name = "Ubuntu 12";
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome3.adwaita-icon-theme;
    };
    gtk2.extraConfig = ''
      gtk-cursor-theme-name = capitaine-cursors;
    '';
    gtk3.extraConfig = { gtk-cursor-theme-name = "capitaine-cursors"; };
  };
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
