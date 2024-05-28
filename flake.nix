{
  description = "Flake dots";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, hyprland, ... }:
    let 
        system = "x86_64-linux";
    in {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./nixos/configuration.nix ];
    };

    homeConfigurations.g = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        hyprland.homeManagerModules.default
	{wayland.windowManager.hyprland.enable = true;}
        ./home-manager/home.nix
      ];
    };
  };
}
