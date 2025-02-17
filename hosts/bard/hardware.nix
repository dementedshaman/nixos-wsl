{delib, ...}:
delib.host {
  name = "bard";

  homeManagerSystem = "x86_64-linux";
  home.home.stateVersion = "24.11";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.11";

    # nixos-generate-config --show-hardware-config
    # other generated code here...
  };

  wsl = {
    enable = true;
    defaultUser = "csanthiago";
    wslConf = {
      network.hostname = "bard";
    };
  };
}
