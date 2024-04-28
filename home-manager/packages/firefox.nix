{
  inputs,
  pkgs,
  config,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "Paveun";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://www.google.com";
          "browser.search.defaltenginename" = "Google";
          "browser.search.order.1" = "Google";
        };
        search = {
          force = true;
          default = "Google";
          order = ["Google" "DuckDuckGo"];
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };
            "NixOS Wiki" = {
              urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = ["@nw"];
            };
            "Bing".metaData.hidden = true;
            "Google".metaData.alias = "@g";
          };
        };
        # extensions = with config.nur.repos.rycee.firefox-addons; [
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          darkreader
          proton-pass
          privacy-badger
          firefox-color
        ];
      };
      meta4 = {
        id = 1;
        name = "Meta4";
        isDefault = false;
        settings = {
          "browser.startup.homepage" = "https://www.google.com";
          "browser.search.defaltenginename" = "Google";
          "browser.search.order.1" = "Google";
        };
        search = {
          force = true;
          default = "Google";
          order = ["Google" "DuckDuckGo"];
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = ["@np"];
            };
            "NixOS Wiki" = {
              urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = ["@nw"];
            };
            "Bing".metaData.hidden = true;
            "Google".metaData.alias = "@g";
          };
        };
        # extensions = with config.nur.repos.rycee.firefox-addons; [
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          darkreader
          proton-pass
          privacy-badger
          firefox-color
        ];
      };
    };
  };
}
