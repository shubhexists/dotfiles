return {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      
      -- Git keymaps
      vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = "Toggle git blame" })
      vim.keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', { desc = "Git diff" })
      vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { desc = "Preview git hunk" })
      vim.keymap.set('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = "Reset git hunk" })
      vim.keymap.set('n', '<leader>gs', ':Gitsigns stage_hunk<CR>', { desc = "Stage git hunk" })
    end
  }