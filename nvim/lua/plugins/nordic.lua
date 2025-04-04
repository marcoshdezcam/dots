return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        -- This callback can be used to override the colors used in the base palette.
        on_palette = function(palette) end,
        -- This callback can be used to override the colors used in the extended palette.
        after_palette = function(palette) end,
        -- This callback can be used to override highlights before they are applied.
        on_highlight = function(highlights, palette) end,
        bold_keywords = true,
        italic_comments = true,
        transparent = {
          bg = true,
          float = true,
        },
        bright_border = true,
        reduced_blue = true,
        swap_backgrounds = false,
        cursorline = {
          bold = true,
          bold_number = true,
          theme = "dark",
          -- Blending the cursorline bg with the buffer bg.
          blend = 1
        },
        noice = {
          style = "flat",
        },
        telescope = {
          style = "flat",
        },
        leap = {
          dim_backdrop = false,
        },
        ts_context = {
          -- Enables dark background for treesitter-context window
          dark_background = true,
        },
      })
    end,
  },
}
