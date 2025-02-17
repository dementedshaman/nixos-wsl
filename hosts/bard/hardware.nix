{delib, inputs, pkgs, ...}:
delib.host {
  name = "bard";

  homeManagerSystem = "x86_64-linux";
  home.home.stateVersion = "24.11";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.11";

    imports = [inputs.nixos-wsl.nixosModules.default];

    environment.systemPackages = with pkgs; [
      git
      wget
    ];

    wsl = {
      enable = true;
      defaultUser = "csanthiago";
      wslConf = {
        network.hostname = "bard";
      };
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    programs.nix-ld = {
      enable = true;
    };
    # nixos-generate-config --show-hardware-config
    # other generated code here...
  };

}
