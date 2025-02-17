{delib, ...}:
delib.module {
  name = "constants";

  options.constants = with delib; {
    username = readOnly (strOption "csanthiago");
    userfullname = readOnly (strOption "Cirios Santhiago");
    useremail = readOnly (strOption "cirios.santhiago@outlook.com");
  };

  myconfig.always = {cfg, ...}: {
    args.shared.constants = cfg;
  };
}
