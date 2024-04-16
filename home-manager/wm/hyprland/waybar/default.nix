{...}: {
  programs.waybar = {
    enable = true;
  };

  home.file = {
    ".config/waybar/config" = {
      source = ./config;
    };
    ".config/waybar/style.css" = {
      source = ./style.css;
    };
  };
}
