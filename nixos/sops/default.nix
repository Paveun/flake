{pkgs, inputs, config, user, ...}:
{
  imports = [
    inputs.sops-nix/nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/${user}/.config/sops/age/key.txt";
  };
}
