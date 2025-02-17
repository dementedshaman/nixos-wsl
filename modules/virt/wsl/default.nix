{ delib, pkgs, host, ... }:
delib.module {
  name = "virt.wsl";

  options = delib.singleEnableOption host.isWsl;

  # nixos.always.imports = [nixos-wsl.nixosModules.default];

  # nixos.ifEnabled.wsl = {
  #   enable = cfg.enable;

  home.ifEnabled.home.packages = with pkgs; [git wget nil nixfmt-rfc-style nix-ld];
}
