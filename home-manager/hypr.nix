{ pkgs, ... }:
{
  # home.packages = with pkgs; [
  #
  # ];

  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    general = { 
      gaps_in = 5;
      gaps_out = 20;

      border_size = 2;

      resize_on_border = false; 

      allow_tearing = false;

      layout = "dwindle";
    };

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    monitor = [
      "eDP-1,1920x1080@60,0x0,1"
    ];

    decoration = {
      rounding = 10;

      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;
      inactive_opacity = 1.0;

      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";

    # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        
        vibrancy = "0.1696";
      };
    };

    bind =
      [
        "$mod, F, exec, foot"
        "$mod, RETURN, exec, foot"
        ", Print, exec, grimblast copy area"
        "$mod, M, exit,"
        "$mod, Z, exec, fuzzel"
        "$mod, W, killactive,"
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +1%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -1%"
        ", XF86MonBrightnessUp, exec, light -A 10"
        ", XF86MonBrightnessDown, exec, light -U 10"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };
}
