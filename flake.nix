{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvchad4nix = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, nixos-wsl, disko, home-manager, hyprland, nur, quickshell, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      extraSpecialArgs = {
        inherit system;
        inherit inputs;
      };
      specialArgs = {
        inherit system;
        inherit inputs;
      };
    in {

      nixosConfigurations = {
        "hermes" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hermes/configuration.nix
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                inherit extraSpecialArgs;
                backupFileExtension = "backup";
                useGlobalPkgs = true;
                useUserPackages = true;
              };
            }
            nur.modules.nixos.default
          ];
        };
        "ares" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./ares/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                inherit extraSpecialArgs;
                backupFileExtension = "backup";
                useGlobalPkgs = true;
                useUserPackages = true;
              };
            }
	    nixos-wsl.nixosModules.default
            nur.modules.nixos.default
          ];
        };
      };
    };
}
