{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
    };

    colorschemes.one.enable = true;
    clipboard.providers.wl-copy.enable = true;

    plugins = {
      alpha = {
        enable = true;
	theme = "dashboard";
      };
      
      lightline.enable = true;

      bufferline.enable = true;

      noice.enable = true;
      notify.enable = true;
	
      telescope.enable = true;

      lsp.enable = true;

      gitsigns.enable = true;
      lazygit.enable = true;

      treesitter.enable = true;
      treesitter-context.enable = true;
      treesitter-textobjects.enable = true;
    };
  };
}
