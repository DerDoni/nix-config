{ config, pkgs, ... }: {
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
    xcape
    dconf
    borgbackup
    magic-wormhole
    maim
    flameshot
    gnuplot
    xclip
    ipfs
    jump
    htop
    rsync
    dosfstools
    mtools
    tree
    ripgrep
    ripgrep-all
    starship
    wget
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
    editorconfig-core-c
    jq
    exercism
    docker-compose
    plantuml
    graphviz
    batik
    vim
    coreutils
    nodePackages.npm

    shellcheck
    zeal

    # Python
    python39
    pipenv
    python39Packages.pytest
    python39Packages.isort
    python39Packages.pyflakes
    black
    python-language-server

    # Nix
    nixfmt

    # Haskell
    ghc
    cabal2nix
    cabal-install
    haskellPackages.hlint
    haskell-language-server
    stack
    haskellPackages.random

    # C
    cmake
    gnumake
    gcc
    libtool
    libvterm

    # Rust
    rustfmt
    rustc
    cargo
    rust-analyzer

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
    element-desktop
    tdesktop
    weechat
    transmission-gtk
    zoom-us
    firefox

    # Window Manager Stuff
    xmobar
    nitrogen
    picom
    trayer

    # Media
    ffmpeg
    imagemagick
    jpegoptim
    img2pdf
    mpv
    ncmpcpp
    mpd
    mpc_cli
    sxiv
    exiftool
    youtube-dl
  ];

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

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.package = pkgs.adwaita-qt;
    style.name = "adwaita-dark";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";
}
