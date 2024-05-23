{
  description = "Flake dots";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let 
        system = "x86_64-linux";
    in {
    nixosConfigurations.nix = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./nixos/configuration.nix ];
    };

    homeConfigurations.g = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./home-manager/home.nix ];
    };
  };
}
