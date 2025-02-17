{ delib, ... }:
delib.module {
  name = "programs.fish";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.programs.fish = {
    enable = true;
  };
}
