{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.self.nixosModules.cloudflare-warp];
  environment.systemPackages = with pkgs; [
    cloudflare-warp
  ];
  services.cloudflare-warp = {
    enable = true;
  };
  systemd.user.services = {
    warp-taskbar = {
      enable = false;
      wantedBy = lib.mkForce [];
    };
    "app-com.cloudflare.WarpTaskbar@autostart".enable = false;
  };
}
