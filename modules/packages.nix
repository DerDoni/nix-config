{ config, lib, pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.java.enable = true;

  programs.qt5ct.enable = true;
  environment.systemPackages = with pkgs; [
    redshift
    cmake
    gnumake
    exa
    libtool
    gnutls
    pkg-config
    libvterm
    automake
    autoconf
    psensor
    zeromq
    openssl
    # Archiving
    unrar
    unzip
    xz
    zip

    # System Utils
    xcape
    teamviewer
    dconf
    maim
    flameshot
    gnuplot
    xclip
    ipfs
    htop
    rsync
    dosfstools
    mtools
    tree
    ripgrep
    ripgrep-all
    wget
    fd
    file
    wine-staging
    mesa
    glxinfo
    fzf
    p7zip
    gvfs
    gitAndTools.gitFull
    bfg-repo-cleaner
    aspell
    aspellDicts.en
    sshfs
    ledger
    rxvt_unicode
    xorg.xkill
    xorg.libXft
    xorg.libXdamage
    killall
    gparted
    binutils
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
    sqlite
    pavucontrol
    docker-compose
    plantuml
    graphviz
    batik
    vim
    coreutils
    nodePackages.npm

    shellcheck
    zeal
    ghc
    cabal2nix
    cabal-install
    haskellPackages.hlint
    haskellPackages.ghcup
    haskellPackages.brittany
    haskellPackages.random
    #haskell-language-server
    stack
    haskellPackages.random

    # Python
    python39Full
    pipenv
    black
    nodePackages.pyright
    python-language-server
    jetbrains.pycharm-professional
    jupyter

    # Rust
    jetbrains.clion
    rustfmt
    rustup
    rustc
    cargo
    rust-analyzer
    lldb

    # Java
    jetbrains.idea-ultimate
    openjdk
    maven
    kotlin
    dart
    flutter

    # PHP
    php

    # C
    gcc
    ccls
    gdb
    valgrind
  ];
}
