{ delib, ... }:
delib.module {
  name = "programs.keychain";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.keychain = {
    enable = true;
    # enableFishIntegration = true;
  };

  nixos.ifEnabled.programs.fish = {
    interactiveShellInit = ''
      keychain --eval --agents ssh -Q id_ed25519 | source
    '';
  };
}
