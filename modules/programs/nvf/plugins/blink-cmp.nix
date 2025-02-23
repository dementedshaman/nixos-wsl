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
        autocomplete.blink-cmp = {
          enable = true;
          # setupOpts = {
          #   sources = [
          #     "lsp"
          #     "path"
          #     "snippets"
          #     "buffer"
          #   ];
          # };
        };
      };
    };
}