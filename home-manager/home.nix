{ config, pkgs, ... }: {
  imports = [
    ./fish.nix
    ./packages.nix
    ./gnome.nix
    ./hypr.nix
  ];

  home = {
    username = "g";
    homeDirectory = "/home/g";
    stateVersion = "23.11";
  };
}
