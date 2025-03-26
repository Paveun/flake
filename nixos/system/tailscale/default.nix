{
  services = {
    resolved.enable = true;
    tailscale = {
      enable = true;
      useRoutingFeatures = "client";
    };
  };
}
