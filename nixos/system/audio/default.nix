{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ];
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    lowLatency = {
      enable = true;
      quantum = 64;
      rate = 4800;
    };
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
}
