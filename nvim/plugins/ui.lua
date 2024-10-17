return {
    -- Theme
    {
      "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      config = function()
        vim.cmd.colorscheme("catppuccin")
      end,
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
    
    -- Comments
    {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },
  }