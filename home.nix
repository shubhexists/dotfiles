{ config, pkgs, ... }:


let
  myAliases = {
      ll = "ls -l";
    };
  in 
  {
  home.username = "jerry";
  home.homeDirectory = "/home/jerry";
  home.stateVersion = "24.05";

  nixpkgs.config.allowUnfree = true; 
  
  home.packages = with pkgs; [
    pkgs.git
    ffmpeg
    vscode
    vlc 
    vesktop
    ffmpeg
  ];

  home.file = {
  };
  
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };

  programs.git = {
    enable = true;
    userName = "shubhexists";
    userEmail = "shubh622005@gmail.com";
  };

  programs.neovim = {
    enable = true;
    
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraPackages = with pkgs; [
      gcc
      git
      nodejs
      ripgrep
      fd
      tree-sitter
    ];

    extraLuaConfig = ''
      -- Lazy.nvim bootstrap code
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
          "git",
          "clone",
          "--filter=blob:none",
          "https://github.com/folke/lazy.nvim.git",
          "--branch=stable",
          lazypath,
        })
      end
      vim.opt.rtp:prepend(lazypath)

      -- Set leader key before lazy setup
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      -- Your existing options
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.splitbelow = true
      vim.opt.splitright = true
      vim.opt.wrap = false
      vim.opt.tabstop = 4
      vim.opt.shiftwidth = 4
      vim.opt.clipboard = "unnamedplus"
      vim.opt.scrolloff = 999
      vim.opt.virtualedit = "block"
      vim.opt.inccommand = "split"
      vim.opt.ignorecase = true
      vim.opt.termguicolors = true

      -- Plugin specifications
      require("lazy").setup({
        -- Your theme
        {
          "catppuccin/nvim",
          name = "catppuccin",
          priority = 1000,
          config = function()
            vim.cmd.colorscheme("catppuccin")
          end,
        },

        -- Treesitter
        {
          "nvim-treesitter/nvim-treesitter",
          config = function()
            require("nvim-treesitter.configs").setup({
              ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust" },
              auto_install = true,
              highlight = { enable = true },
              incremental_selection = {
                enable = true,
                keymaps = {
                  init_selection = "<Leader>ss",
                  node_incremental = "<Leader>si",
                  scope_incremental = "<Leader>sc",
                  node_decremental = "<Leader>sd",
                },
              },
            })
          end,
        },

        -- File explorer
        {
          "nvim-neo-tree/neo-tree.nvim",
          dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
          },
          config = function()
            vim.keymap.set('n', '<leader>f', ':Neotree toggle<CR>')
          end
        },

        -- Telescope (Fuzzy Finder)
        {
          'nvim-telescope/telescope.nvim',
          dependencies = { 'nvim-lua/plenary.nvim' },
          config = function()
            local telescope = require('telescope')
            telescope.setup({})
            
            -- File operations with leader f
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
            vim.keymap.set('n', '<leader>fr', builtin.live_grep, { desc = "Find text" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
          end
        },

        -- Git integration with leader g
        {
          'lewis6991/gitsigns.nvim',
          config = function()
            require('gitsigns').setup()
            
            -- Git operations with leader g
            vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle git blame" })
            vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = "Git diff" })
            vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { desc = "Preview git hunk" })
            vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = "Reset git hunk" })
            vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = "Stage git hunk" })
          end
        },

        -- Status line
        {
          'nvim-lualine/lualine.nvim',
          dependencies = { 'nvim-tree/nvim-web-devicons' },
          config = function()
            require('lualine').setup()
          end
        },

        -- Auto pairs
        {
          'windwp/nvim-autopairs',
          event = "InsertEnter",
          config = function()
            require('nvim-autopairs').setup()
          end
        },

        -- Comment toggler
        {
          'numToStr/Comment.nvim',
          config = function()
            require('Comment').setup()
          end
        },

        -- LSP Support
        {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v3.x',
          dependencies = {
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
          },
          config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
              lsp_zero.default_keymaps({buffer = bufnr})
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
              ensure_installed = {
                'lua_ls',
                'rust_analyzer',
                'tsserver',
                'pyright',
              },
              handlers = {
                lsp_zero.default_setup,
              }
            })
          end
        },
      })

      -- Additional keymaps
      vim.keymap.set('n', '<leader>w', ':w<CR>')
      vim.keymap.set('n', '<leader>q', ':q<CR>')
    '';
 };
  home.sessionVariables = {
    EDITOR = "nvim";
 
};

   dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      focus-mode = "sloppy";
    };
    "org/gnome/desktop/wm/preferences" = {
      raise-on-click = true;  
    };
  };

  programs.home-manager.enable = true;
}
