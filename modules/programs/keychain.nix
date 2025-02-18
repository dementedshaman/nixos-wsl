{ delib, ... }:
delib.module {
  name = "programs.keychain";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.keychain = {
    enable = true;
    enableFishIntegration = true;
    keys = [
      "csanthiago"
      "id_ed25519"
    ];
    agents = ["ssh"];
  };
}
