{ ... }: {
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.XCURSOR_SIZE = "32";
  environment.sessionVariables.HYPRCURSOR_SIZE = "32";
}
