{ pkgs, config, lib, ... }:
{
  imports = [
    ./waybar.nix
  ];
  home.packages = with pkgs; [
    grimblast
  ];

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload =
        [ "/home/g/pix/walls/garden.jpg" ];

      wallpaper = [
        ",/home/g/pix/walls/garden.jpg"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 300;
        hide_cursor = true;
        no_fade_in = false;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, -80";
          monitor = "";
          dots_center = true;
          fade_on_empty = false;
          font_color = "rgb(202, 211, 245)";
          inner_color = "rgb(91, 96, 120)";
          outer_color = "rgb(24, 25, 38)";
          outline_thickness = 5;
          placeholder_text = "'\'Password...'\'";
          shadow_passes = 2;
        }
      ];
    };
  };

  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    general = { 
      gaps_in = 5;
      gaps_out = 5;

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
      "eDP-1,1920x1080@60,0x1080,1"
      "HDMI-A-1,1920x1080@60,0x0,1"
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
