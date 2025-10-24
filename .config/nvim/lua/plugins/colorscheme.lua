{
  "kaicataldo/material.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.material_style = "deep ocean"
    require("material").setup({
      styles = {
        comments = { italic = true },
        functions = { italic = true },
        keywords = { italic = false },
        variables = { italic = false },
        types = { italic = false },
        constants = { italic = false },
      },
      custom_highlights = {
        -- Language-specific function italics
        ["@function"] = { italic = true },
        ["@function.call"] = { italic = true },
        ["@method"] = { italic = true },
        ["@method.call"] = { italic = true },
        ["@constructor"] = { italic = false }, -- usually not italic
      }
    })
    vim.cmd.colorscheme("material")

    -- Additional manual overrides if needed
    vim.schedule(function()
      vim.api.nvim_set_hl(0, "Comment", { italic = true })
      vim.api.nvim_set_hl(0, "Function", { italic = true })
    end)
  end,
}
