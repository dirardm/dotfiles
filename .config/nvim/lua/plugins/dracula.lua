-- ~/.config/nvim/lua/plugins/dracula.lua

return {
  "Mofiqul/dracula.nvim",
  lazy = false,    -- load immediately, not lazily
  priority = 1000, -- make sure to load this before all other start plugins
  config = function()
    -- Load the colorscheme here
    vim.cmd.colorscheme 'dracula'
  end,
}
