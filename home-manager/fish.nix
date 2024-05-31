{ config, pkgs, lib, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      fish_vi_key_bindings
    '';
    plugins = [
      {
	name = "pure";
	src = pkgs.fetchFromGitHub {
	  owner = "pure-fish";
	  repo = "pure";
	  rev = "master";
	  sha256 = "sha256-8zxqPU9N5XGbKc0b3bZYkQ3yH64qcbakMsHIpHZSne4=";
	};
      }
    ];
  };
}
