{ config, pkgs, ... }: {
  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      iosevka
      libre-baskerville
      emacs-all-the-icons-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      etBook
      ia-writer-duospace
      fira-code
      fira-code-symbols
      mononoki
      font-awesome
      ipafont
      kochi-substitute
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Source Code Pro" ];
        sansSerif = [ "Source Sans Pro" ];
        serif = [ "Source Serif Pro" ];
      };
    };
  };
}
