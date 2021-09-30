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
    borgbackup
    magic-wormhole
    alacritty
    pcmanfm
    jump
    starship
    ranger
    hueadm
    xdg_utils
    # Code
    editorconfig-core-c
    jq
    exercism
    # Nix
    nixfmt

    # Research
    calibre
    proselint
    zotero
    texlive.combined.scheme-full
    zathura
    pandoc

    # Apps
    anki
    remmina
    brave
    nyxt
    slack
    discord
    teams
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
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.emacs = {
    enable = true;
    #    package = pkgs.emacsPgtkGcc;
    extraPackages = epkgs: [ epkgs.vterm epkgs.clang-format ];
  };
  programs.neovim = {
    enable = true;
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [ coc-nvim coc-python ];
    extraPackages = with pkgs;
      [
        (python3.withPackages
          (ps: with ps; [ black flake8 pytest pipenv isort ]))
      ];
    extraPython3Packages = (ps: with ps; [ jedi ]);
  };

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
