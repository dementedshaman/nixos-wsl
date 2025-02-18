{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.devbox";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.environment.systemPackages = with pkgs; [
    devbox
  ];
}