{
  config,
  inputs,
  ...
}: {
  imports = [
    # inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # lowLatency = {
    #   enable = true;
    #   quantum = 64;
    #   rate = 4800;
    # };
    # extraConfig.pipewire."92-low-latency" = {
    #   "context.properties" = {
    #     "default.clock.rate" = 48000;
    #     "default.clock.quantum" = 32;
    #     "default.clock.min-quantum" = 32;
    #     "default.clock.max-quantum" = 32;
    #   };
    # };
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
}
