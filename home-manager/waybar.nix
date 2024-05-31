{ ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          # "HDMI-A-1"
        ];
        modules-left = [ "hypr/workspaces" "wlr/taskbar" ];
        modules-center = [ "hypr/window" "custom/hello-from-waybar" ];
        modules-right = [ "temperature" ];
      };
    };
  };
}
