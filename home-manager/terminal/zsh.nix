{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = "${pkgs.krabby}/bin/krabby random --no-title";
    shellAliases = {
      ssh = "TERM=xterm-256color command ssh";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "python"
        "man"
        "z"
      ];
    };
  };
}
