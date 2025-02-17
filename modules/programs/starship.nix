{ delib, lib, pkgs, homeconfig, ... }:
delib.module {
  name = "programs.starship";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    programs = {
      bash.promptInit = ''
        if [[ ! -f "$HOME/.config/starship.toml" ]]; then
          export STARSHIP_CONFIG="${homeconfig.xdg.configHome}/starship.toml"
        fi
        eval "$(${lib.getExe pkgs.starship} init bash)"
      '';
      fish.promptInit = ''
        if not test -f "$HOME/.config/starship.toml";
          set -x STARSHIP_CONFIG "${homeconfig.xdg.configHome}/starship.toml"
        end
        eval "$(${lib.getExe pkgs.starship} init fish)"
      '';
      zsh.promptInit = ''
        if [[ ! -f "$HOME/.config/starship.toml" ]]; then
          export STARSHIP_CONFIG="${homeconfig.xdg.configHome}/starship.toml"
        fi
        eval "$(${lib.getExe pkgs.starship} init zsh)"
      '';
    };
  };

  home.ifEnabled.programs.starship = {
    enable = true;

    settings = {
      format = lib.concatStrings [
        "[](orange)"
        "$username"
        "$hostname"
        "[](bg:yellow fg:orange)"
        "$directory"
        "[](fg:yellow bg:aqua)"
        "$nix_shell"
        "[](fg:aqua bg:blue)"
        "$git_branch"
        "$git_status"
        "$cmd_duration"
        "[ ](fg:bg1)"
        "$line_break"
        "$character"
      ];

      add_newline = true;
      scan_timeout = 10;

      character = {
        success_symbol = "[❯](bold dimmed green)";
        error_symbol = "[❯](bold dimmed red)";
      };
      os = {
        style = "bg:color_orange fg:color_fg0";
      };
      os.symbols = {
        Windows = "󰍲";
        Ubuntu = "󰕈";
        SUSE = "";
        Raspbian = "󰐿";
        Mint = "󰣭";
        Macos = "󰀵";
        Manjaro = "";
        Linux = "󰌽";
        Gentoo = "󰣨";
        Fedora = "󰣛";
        Alpine = "";
        Amazon = "";
        Android = "";
        Arch = "󰣇";
        Artix = "󰣇";
        EndeavourOS = "";
        CentOS = "";
        Debian = "󰣚";
        Redhat = "󱄛";
        RedHatEnterprise = "󱄛";
        Pop = "";
        NixOs = "";
      };
      username = {
        style_user = "bg:color_orange fg:fg0";
        style_root = "bg:orange fg:fg0";
        format = "[ $user ]($style)";
      };
      directory = {
        format = "[ $path ]($style)";
        style = "fg:fg0 bg:yellow";
        truncation_length = 3;
        truncation_symbol = ".../";
      };
      git_branch = {
        style = "bold dimmed green";
        format = "on [$branch]($style) ";
        ignore_branches = [ "master" "main" ];
      };
      cmd_duration = {
        min_time = 1000;
        style = "bold dimmed green";
        format = "took [$duration]($style) ";
      };
      hostname = {
        ssh_only = false;
        ssh_symbol = "*";
        format = "[$hostname$ssh_symbol]($style) ";
        style = "bg:color_orange fg:fg0";
      };
      nix_shell = {
        style = "bold purple";
        format = "via [$state( ($name))]($style) ";
      };
      line_break = {};

      palette = "everforest";

      palettes.everforest = {
        bg_dim = "#232a2e";
        bg0 = "#2d353b";
        bg1 = "#343f44";
        bg2 = "#3d484d";
        bg3 = "#475258";
        bg4 = "#4f585e";
        bg5 = "#56635f";
        bg_visual = "#543a48";
        bg_red = "#514045";
        bg_green = "#425047";
        bg_blue = "#3a515d";
        bg_yellow = "#4d4c43";

        fg = "#d3c6aa";
        red = "#e67e80";

        orange = "#e69875";
        yellow = "#dbbc7f";
        green = "#a7c080";
        aqua = "#83c092";
        blue = "#7fbbb3";
        purple = "#d699b6";
        grey0 = "#7a8478";
        grey1 = "#859289";
        grey2 = "#9da9a0";
        statusline1 = "#a7c080";
        statusline2 = "#d3c6aa";
        statusline3 = "#e67e80";
      };
    };
  };
}
