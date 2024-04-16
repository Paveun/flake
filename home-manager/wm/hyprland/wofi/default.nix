{...}: {
  programs.wofi = {
    enable = true;
    settings = {
      show = "drun";
      width = 750;
      height = 400;
      always_parse_args = true;
      show_all = false;
      term = "alacritty";
      hide_scroll = true;
      print_command = true;
      insensitive = true;
      prompt = " ";
      columns = 2;
      key_expand = "Tab";
    };
  };
  home.file = {
    # ".config/wofi/config"={
    #   source = ./config;
    # };
    ".config/wofi/style.css" = {
      source = ./style.css;
    };
  };
}
