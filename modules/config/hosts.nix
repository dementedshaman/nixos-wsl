{delib, ...}:
delib.module {
  name = "hosts";

  options = with delib; let
    host = {config, ...}: {
      options =
        hostSubmoduleOptions
        // {
          type = noDefault (enumOption ["desktop" "server" "wsl"] null);

          isDesktop = boolOption (config.type == "desktop");
          isServer = boolOption (config.type == "server");
          isWsl = boolOption (config.type == "wsl");
        };
    };
  in {
    host = hostOption host;
    hosts = hostsOption host;
  };

  myconfig.always = {myconfig, ...}: {
    args.shared = {
      inherit (myconfig) host hosts;
    };
  };

  home.always = {myconfig, ...}: {
    assertions = delib.hostNamesAssertions myconfig.hosts;
  };
}
