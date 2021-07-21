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
      jetbrains-mono
      mononoki
      font-awesome
      ipafont
      kochi-substitute
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Iosevka" ];
        sansSerif = [ "Iosevka" ];
        serif = [ "Source Serif Pro" ];
      };
    };
  };
}
