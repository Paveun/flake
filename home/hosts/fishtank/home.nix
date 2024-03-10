{ config, pkgs, lib, user, ... }:

{
  home.packages = with pkgs; [
    liquidctl
    razergenie
    via
  ];
  # xdg.desktopEntries = {
  #   postman = {
  #     categories = [ "Development" ];
  #     comment = "API Development Environment";
  #     exec = "postman --disable-gpu";
  #     genericName = "Postman";
  #     icon = "postman";
  #     name = "Postman";
  #     type = "Application";
  #   };
  #   webcord = {
  #     categories = [ "Network" "InstantMessaging" ];
  #     comment = "A Discord and Fosscord electron-based client implemented without Discord API";
  #     exec = "webcord --disable-gpu";
  #     icon = "webcord";
  #     name = "WebCord";
  #     type = "Application";
  #   };
  # };
}
