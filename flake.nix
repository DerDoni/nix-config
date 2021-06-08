  {
    description = "home manager system configurations";

    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      emacs-overlay = {
        url = "github:nix-community/emacs-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, emacs-overlay, ... }: {
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
