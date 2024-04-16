{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      wget
      cifs-utils
    ];
  };
}
