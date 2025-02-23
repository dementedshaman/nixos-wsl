{
  delib,
  inputs,
  homeconfig,
  ...
}:
delib.module {
  name = "programs.nvf";

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nvf.settings.vim = {
        telescope = {
          enable = true;
        };
      };
    };
}
