{
  description = "Flake dots";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    sops-nix.url = "github:Mic92/sops-nix";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, nixvim, sops-nix, ... }@inputs:
    let
        system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./nixos/configuration.nix
      ];
    };

    homeConfigurations.g = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        hyprland.homeManagerModules.default
	{wayland.windowManager.hyprland.enable = true;}
	nixvim.homeManagerModules.nixvim
        ./home-manager/home.nix
      ];
    };
  };
}
