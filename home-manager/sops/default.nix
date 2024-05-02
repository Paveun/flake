{inputs, user, ...}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];
  sops = {
    age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;
    validateSopsFile = false;
    # secrets = {
    #   "private_keys/fishtank" = {
    #     path = "/home/${user}/.ssh/id_fishtank";
    #   };
    # };
  };
}
