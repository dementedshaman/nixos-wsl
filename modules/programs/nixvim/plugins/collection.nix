{
  delib,
  inputs,
  pkgs,
  homeconfig,
  ...
}:
delib.module {
  name = "programs.nixvim";

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nixvim = {
        plugins = {
          web-devicons.enable = true;
          sleuth = {
            enable = true;
          };
          todo-comments = {
            settings = {
              enable = true;
              signs = true;
            };
          };
        };
        extraPlugins = with pkgs.vimPlugins; [
          nvim-web-devicons
        ];
        extraConfigLuaPre = ''
          if vim.g.have_nerd_font then
            require('nvim-web-devicons').setup {}
          end
        '';
      };
    };
}
