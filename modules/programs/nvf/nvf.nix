{
  delib,
  inputs,
  homeconfig,
  ...
}:
delib.module {
  name = "programs.nvf";

  options = delib.singleEnableOption true;

  home.always.imports = [ inputs.nvf.homeManagerModules.default ];

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nvf = {
        enable = true;

        settings = {
          vim = {
            viAlias = true;
            vimAlias = true;
            globals = {
              mapleader = " ";
              maplocalleader = " ";
            };
          };
        };
      };
    };
}
