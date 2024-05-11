{pkgs, inputs, ...}: {
  imports = [inputs.self.nixosModules.cloudflare-warp];
  environment.systemPackages = with pkgs; [
    cloudflare-warp
  ];
  services.cloudflare-warp = {
    enable = true;
  };
}
