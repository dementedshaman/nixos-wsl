{delib, ...}:
delib.module {
  name = "programs.eza";

  options = {myconfig, ...}: {
    programs.eza = with delib; {
      enable = boolOption true;
    };
  };

  home.ifEnabled = {cfg, ...}: {
    programs.eza = {
      enable = true;

      git = true;

      enableFishIntegration = true;

      extraOptions = [
        "--hyperlink"
        "--no-permissions"
        "--no-user"
        "--no-time"
        "--group-directories-first"
      ];
    };
  };
}