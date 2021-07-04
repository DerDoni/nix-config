{ config, lib, pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.java.enable = true;

  programs.qt5ct.enable = true;
  environment.systemPackages = [ pkgs.redshift ];
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
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

}
