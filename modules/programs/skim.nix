{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.skim";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.skim = {
    enable = true;
    enableFishIntegration = true;
  };
}