{ pkgs, ... }:

{
  # ...
  dconf.settings = {
    # ...
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
	"caffeine@patapon.info"
      ];
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.dash-to-dock
    gnomeExtensions.appindicator
    gnome.gnome-tweaks
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
  ];
}

