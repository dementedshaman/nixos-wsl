{
  delib,
  pkgs,
  ...
}:
delib.module {
  name = "programs.fzf";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.fzf = {
    enable = true;
    enableFishIntegration = true;
    changeDirWidgetCommand = "fd --type d";
    changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
  };
}