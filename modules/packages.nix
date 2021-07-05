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
    gcc
    libtool
    libvterm
    # Archiving
    unrar
    unzip
    xz
    zip

    # System Utils
    xcape
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
    haskell-language-server
    stack
    haskellPackages.random
    # Python
    python39
    pipenv
    python39Packages.pytest
    python39Packages.pip
    python39Packages.isort
    python39Packages.pyflakes
    black
    python-language-server
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

  ];
}
