{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.zellij";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = false;
      default_shell = "fish";
      pane_frames = false;
      default_layout = "compact";
      default_mode = "locked";
      mouse_mode = false;
    };
    enableFishIntegration = false;
  };
}
