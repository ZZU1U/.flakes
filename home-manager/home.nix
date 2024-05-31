{ config, pkgs, ... }: {
  imports = [
    ./fish.nix
    ./packages.nix
    ./gnome.nix
    ./hypr.nix
    ./waybar.nix
    ./nvim.nix
    #./gtk.nix
  ];

  home = {
    username = "g";
    homeDirectory = "/home/g";
    stateVersion = "23.11";
  };
}
