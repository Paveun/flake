{
  pkgs,
  home-manager,
  catppuccin,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # enableNvidiaPatches = true;
    xwayland.enable = true;
    catppuccin.enable = true;
    catppuccin.flavour = "frappe";
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar --config $HOME/.config/waybar/config --style $HOME/.config/waybar/style.css"
        "nm-applet --indicator & disown"
        "dunst"
        "hyprpaper"
        "udiskie"
        "hyprctl setcursor Catppuccin-Frappe-Rosewater-Cursors 24"
        "wl-paste --type text --watch cliphist store" #Stores only text data
        "wl-paste --type image --watch cliphist store" #Stores only image data
        # copyq --start-server"
      ];
      "$mainMod" = "SUPER";
      general = {
        layout = "dwindle";
        allow_tearing = false;
        gaps_in = 3;
        gaps_out = 6;
        border_size = 2;
        "col.active_border" = "$rosewater";
        "col.inactive_border" = "$base";
      };
      decoration = {
        rounding = 0;
      };
      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
      };
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
        "HYPRCURSOR_THEME,Catppuccin-Frappe-Rosewater-Cursors"
        "HYPRCURSOR_SIZE,24"
      ];
      misc = {
        force_default_wallpaper = 0;
      };
      master = {
        new_is_master = true;
      };
      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };
      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      bind =
        [
          "$mainMod, Q, exec, alacritty"
          "$mainMod, C, killactive, "
          "$mainMod, M, exit, "
          "$mainMod, L, exec, hyprlock"
          "$mainMod, E, exec, thunar"
          "$mainMod, V, togglefloating, "
          "$mainMod, R, exec, wofi"
          "$mainMod, P, pseudo, "
          "$mainMod, J, togglesplit, "
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
          "SUPER, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
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
                "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
                "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            )
            10)
        );
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = 0;
      };
    };
    extraConfig = ''
      monitor=,highrr,auto,1
      device {
        name = razer-razer-naga-pro
        sensitivity = -0.7
      }
      device {
        name = razer-razer-naga-pro-1
        sensitivity = -0.7
      }
    '';
  };
}
