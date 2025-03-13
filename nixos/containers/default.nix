{
  configs,
  pkgs,
  user,
  ...
}: {
  virtualisation = {
    # podman = {
    #   enable = true;
    #   # Create a `docker` alias for podman, to use it as a drop-in replacement
    #   dockerCompat = true;
    #   # Required for containers under podman-compose to be able to talk to each other.
    #   defaultNetwork.settings = {
    #     dns_enabled = true;
    #   };
    # };
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
  users.users.${user}.extraGroups = ["docker"];
  environment.systemPackages = [
    pkgs.docker-compose
    # pkgs.podman-compose
  ];
}
