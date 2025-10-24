return {
  -- Material Colorscheme
  {
    'marko-cerovac/material.nvim',
    priority = 1000,
    config = function()
      vim.g.material_style = 'darker'
      require('material').setup()
      vim.cmd('colorscheme material')
    end,
  },

  -- Icons
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  -- File tree
  {
    'nvim-tree/nvim-tree.lua',
    keys = {
      { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'File Tree' },
    },
    config = function()
      require('nvim-tree').setup({
        view = { width = 35 },
        filters = { dotfiles = false },
      })
    end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
      { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
      { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    },
    config = function()
      require('telescope').setup({})
    end,
  }
}
