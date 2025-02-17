{delib, ...}:
delib.module {
  name = "virt.wsl";

  options = {myconfig, ...} @ args: delib.singleEnableOption myconfig.host.isWsl args;

  nixos.always.imports = [nixos-wsl.nixosModules.default];

  nixos.ifEnabled.wsl = {
    enable = cfg.enable;
  };
}