{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.yazi";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
}