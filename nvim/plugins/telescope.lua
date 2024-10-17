return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      telescope.setup({})
      
      -- Simplified keybindings
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Find files" })
      vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = "Find text" })
      vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = "Find buffers" })
      vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = "Find help" })
    end
  }