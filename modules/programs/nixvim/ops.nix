{
  delib,
  inputs,
  homeconfig,
  ...
}:
delib.module {
  name = "programs.nixvim";

  home.ifEnabled =
    { cfg, ... }:
    {
      programs.nixvim.opts = {
        number = true;
        relativenumber = true;

        mouse = " ";

        showmode = false;

        breakindent = true;

        undofile = true;

        ignorecase = true;
        smartcase = true;

        signcolumn = "yes";

        updatetime = 250;

        timeoutlen = 300;

        splitright = true;
        splitbelow = true;

        list = true;
        listchars = {
          tab = "-»";
          trail = "·";
          nbsp = "␣";
        };

        inccommand = "split";

        cursorline = true;

        scrolloff = 10;
        
        hlsearch = true;

        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
        softtabstop = 2;

        # foldcolumn = "1";
        # foldlevel = 99;
        # foldlevelstart = 99;
        # foldenable = true;
        # fillchars = {
        #   eob = " ";
        #   fold = " ";
        #   foldopen = "";
        #   foldsep = " ";
        #   foldclose = "";
        # };
      };
    };
}
