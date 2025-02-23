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
      # [[ Setting options ]]
      # See `:help vim.opt`
      # NOTE: You can change these options as you wish!
      #  For more options, you can see `:help option-list`
      programs.nvf.settings.vim.options = {

        # Make line numbers default
        number = true;
        relativenumber = true;

        # Disables mouse
        mouse = "";

        # Don't show the mode, since it's already in the status line
        showmode = false;

        # Enable break indent
        breakindent = true;

        # Save undo history
        undofile = true;

        # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
        ignorecase = true;
        smartcase = true;

        # Keep signcolumn on by default
        signcolumn = true;

        # Decrease update time
        updatetime = 250;

        # Decrease mapped sequence wait time
        timeoutlen = 300;

        # Configure how new splits should be opened
        splitright = true;
        splitbelow = true;

        # Sets how neovim will display certain whitespace characters in the editor.
        list = true;
        listchars = {
          tab = "» ";
          trail = "·";
          nbsp = "␣";
          };

        # Preview substitutions live, as you type!
        inccommand = "split";
        
        #Show which line your cursor is on
        cursorline = true;
        
        # Minimal number of screen lines to keep above and below the cursor.
        scrolloff = 10;

        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        expandtab = true;
      };
    };
}
