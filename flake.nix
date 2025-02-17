{
  description = "Modular configuration of Home Manager and NixOS with Denix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    denix = {
      url = "github:yunfachi/denix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { denix, nixpkgs, ... }@inputs:
    let
      mkConfigurations = isHomeManager:
        denix.lib.configurations rec {
          homeManagerNixpkgs = nixpkgs;
          homeManagerUser = "csanthiago";
          inherit isHomeManager;

          paths = [ ./hosts ./modules ./rices ];
          # paths = [./hosts ./modules];

          specialArgs = { inherit inputs isHomeManager homeManagerUser; };
        };
    in {
      nixosConfigurations = mkConfigurations false;
      homeConfigurations = mkConfigurations true;
    };
}
