{ config, lib, pkgs, inputs, ... }:

with lib;
with lib.my;
let
  cfg = config.modules.editors.emacs;
  configDir = config.dotfiles.configDir;
in {
  options.modules.editors.emacs = {
    enable = mkBoolOpt false;
    doom = {
      enable = mkBoolOpt true;
      fromSSH = mkBoolOpt false;
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.emacs-overlay.overlay ];

    user.packages = with pkgs; [
      ## Emacs itself
      binutils # native-comp needs 'as', provided by this
      emacsPgtkGcc # 28 + pgtk + native-comp

      ## Doom dependencies
      git
      (ripgrep.override { withPCRE2 = true; })
      gnutls # for TLS connectivity

      ## Optional dependencies
      fd # faster projectile indexing
      imagemagick # for image-dired
      (mkIf (config.programs.gnupg.agent.enable)
        pinentry_emacs) # in-emacs gnupg prompts
      zstd # for undo-fu-session/undo-tree compression

      ## Module dependencies
      # :checkers spell
      (aspellWithDicts (ds: with ds; [ en en-computers en-science ]))
      # :checkers grammar
      languagetool
      # :tools editorconfig
      editorconfig-core-c # per-project style config
      # :tools lookup & :lang org +roam
      sqlite
      # :lang cc
      ccls
      # :lang javascript
      nodePackages.javascript-typescript-langserver
      # :lang latex & :lang org (latex previews)
      texlive.combined.scheme-medium
      # :lang beancount
      beancount
      fava
      # :lang rust
      rustfmt
      unstable.rust-analyzer
    ];

    env.PATH = [ "$XDG_CONFIG_HOME/emacs/bin" ];
  };
}
