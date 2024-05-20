{
  user,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  programs.zsh.enable = true;
  # users.users.${user}.shell = pkgs.zsh;
  users.defaultUserShell = pkgs.zsh;
}
