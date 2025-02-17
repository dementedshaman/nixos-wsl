{ delib, inputs, pkgs, ... }:
delib.host {
  name = "bard";

  homeManagerSystem = "x86_64-linux";
  home.home.stateVersion = "24.11";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.11";

    imports = [ inputs.nixos-wsl.nixosModules.default ];

    wsl = {
      enable = true;
      defaultUser = "csanthiago";
      wslConf = { network.hostname = "bard"; };
    };

    # nixos-generate-config --show-hardware-config
    # other generated code here...
  };

}
