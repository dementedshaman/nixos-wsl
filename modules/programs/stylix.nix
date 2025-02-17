{
  delib,
  inputs,
  homeconfig,
  pkgs,
  ...
}:
delib.module {
  name = "programs.stylix";

  options.programs.stylix = with delib; {
    enable = boolOption true;
  };

  myconfig.always.args.shared.nixvimLib = homeconfig.lib.nixvim;

  home.always.imports = [inputs.stylix.homeManagerModules.stylix];

  home.ifEnabled = {cfg, ...}: {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest.yaml";
      image = pkgs.fetchurl {
        url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
        sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
      };
      targets.fish.enable = true;
    };
  };
}
