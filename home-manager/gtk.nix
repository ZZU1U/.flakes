# users/ana/home.nix
{ pkgs, ... }:

{
  # ...
  gtk = {
    enable = true;

    iconTheme = {
      name = "Pop";
      package = pkgs.pop-icon-theme;
    };

    theme = {
      name = "Adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    cursorTheme = {
      name = "GoogleDot-Black";
      package = pkgs.google-cursor;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "Adw-gtk3-dark";
}
