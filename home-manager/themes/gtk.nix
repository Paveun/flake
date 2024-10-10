{pkgs, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      # name = "rose-pine";
      # package = pkgs.rose-pine-icon-theme;
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "rosewater";
      };
    };
  };
}
