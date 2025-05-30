{
  pkgs,
  inputs,
  ...
}: {
  services = {
    # xserver.enable = true;
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
      defaultSession = "gnome";
    };
    desktopManager.gnome.enable = true;
    # dbus.packages = with pkgs; [gnome2.GConf];
  };
  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    caffeine
    alphabetical-app-grid
    clipboard-history
  ];
  # environment.sessionVariables.MUTTER_DEBUG_KMS_THREAD_TYPE = "user";
  # nixpkgs.overlays = [
  #   (self: super: {
  #     mutter = super.mutter.overrideAttrs (old: {
  #       src = inputs.mutter-triple-buffering-src;
  #       preConfigure = ''
  #         cp -a "${inputs.gvdb-src}" ./subprojects/gvdb
  #       '';
  #     });
  #   })
  # ];
}
