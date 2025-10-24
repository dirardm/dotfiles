return {
  -- Airline configuration
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    init = function()
      -- Enable powerline fonts
      vim.g.airline_powerline_fonts = 1
      -- Set the airline theme (using 'dark' since 'material' doesn't exist)
      vim.g.airline_theme = 'base16_material_palenight'
      -- Remove trailing angle at the end
      vim.g.airline_skip_empty_sections = 1
    end,
    config = function()
      -- Enable the tabline extension (set to 0 to disable, 1 to enable)
      vim.g['airline#extensions#tabline#enabled'] = 0
      
      -- Always show a statusline, even with one window
      vim.opt.laststatus = 2
      
      -- Show the current time in the statusline
      vim.g.airline_section_b = '%{strftime("%+")}'
    end
  }
}
