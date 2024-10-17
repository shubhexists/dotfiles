{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraLuaConfig = ''
      require("lazy").setup({
        -- Import plugin configurations from Lua files
        require("plugins.telescope"),
        require("plugins.treesitter"),
        require("plugins.lsp"),
        require("plugins.git"),
        require("plugins.ui"),
      })
    '';
  };
}
