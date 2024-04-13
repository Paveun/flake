{ pkgs, home-manager, catppuccin, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
    catppuccin.enable = true;
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar --config $HOME/.config/waybar/config --style $HOME/.config/waybar/style.css"
        "nm-applet --indicator & disown"
        "dunst"
        "hyprpaper"
        "udiskie"
        "hyprctl setcursor Catppuccin-Frappe-Rosewater-Cursors 24"
      ];
      "$mainMod" = "SUPER";
      general = {
        layout = "dwindle";
      };
      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
      };
      ENV = [
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
      bind = [
        "mainMod, Q, exec alacritty"
        "$mainMod, C, killactive, "
        "$mainMod, M, exit, "
        "$mainMod, E, exec, thunar"
        "$mainMod, V, togglefloating, "
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo, "
        "$mainMod, J, togglesplit, "
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
    extraConfig = "monitor=,highrr,auto,1";
  };
}
