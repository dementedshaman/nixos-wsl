{
  delib,
  host,
  ...
}:
delib.module {
  name = "dconf";

  options = delib.singleEnableOption host.isWsl;

  nixos.ifEnabled.programs.dconf.enable = true;
}
