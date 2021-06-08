{
  description = "home manager system configurations";

  inputs = {
    devshell.url = "github:numtide/devshell";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:nixos/nixos-hardware";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-20.09";
    treefmt.url = "github:numtide/treefmt";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixos-hardware, devshell
    , flake-utils, treefmt, emacs-overlay, ... }: {

      #      nixosConfigurations.dracula = nixpkgs.lib.nixosSystem {
      #
      #        system = "x86_64-linux";
      #        modules = [ ./configuration.nix ./modules/hardware/dracula.nix ];
      #      };

      homeConfigurations = {
        dracula = home-manager.lib.homeManagerConfiguration rec {
          system = "x86_64-linux";
          username = "vincenzo";
          homeDirectory = "/home/${username}";
          extraSpecialArgs = { inherit inputs; };
          configuration = {
            imports = [ ./home.nix ];
            nixpkgs.overlays = [ emacs-overlay.overlay ];
          };
        };
      };
    };
}
