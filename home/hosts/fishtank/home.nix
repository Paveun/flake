{ config, pkgs, lib, user, ... }:

{
  home.packages = with pkgs; [
    liquidctl
    razergenie
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  xdg.desktopEntries = {
    postman = {
      categories = [ "Development" ];
      comment = "API Development Environment";
      exec = "postman --disable-gpu";
      genericName = "Postman";
      icon = "postman";
      name = "Postman";
      type = "Application";
    };
    webcord = {
      categories = [ "Network" "InstantMessaging" ];
      comment = "A Discord and Fosscord electron-based client implemented without Discord API";
      exec = "webcord --disable-gpu";
      icon = "webcord";
      name = "WebCord";
      type = "Application";
    };
  };
}