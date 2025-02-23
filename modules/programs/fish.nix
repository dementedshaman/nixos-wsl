{ delib, ... }:
delib.module {
  name = "programs.fish";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.programs.fish = {
    enable = true;
  };

  home.ifEnabled.programs.fish = {
    enable = true;
  };
}
