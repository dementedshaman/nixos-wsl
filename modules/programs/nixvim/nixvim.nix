{
  delib,
  inputs,
  homeconfig,
  ...
}:
delib.module {
  name = "programs.nixvim";

  options.programs.nixvim = with delib; {
    enable = boolOption false;

    defaultEditor = boolOption true;
  };

  myconfig.always.args.shared.nixvimLib = homeconfig.lib.nixvim;

  home.always.imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nixvim = {
        enable = true;
        inherit (cfg) defaultEditor;
        # nixpkgs.useGlobalPackages = false;

        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        autoGroups = {
          kickstart-highlight-yank = {
            clear = true;
          };
        };

        autoCmd = [
          # Highlight when yanking (copying) text
          #  Try it with `yap` in normal mode
          #  See `:help vim.highlight.on_yank()`
          {
            event = [ "TextYankPost" ];
            desc = "Highlight when yanking (copying) text";
            group = "kickstart-highlight-yank";
            callback.__raw = ''
              function()
                vim.highlight.on_yank()
              end
            '';
          }
        ];

        diagnostics = {
          update_in_insert = true;
        };
      };
    };
}
