return {
  -- Everforest
  -- {
  --  "sainnhe/everforest",
  --  lazy = false,
  --  priority = 1000,
  --  config = function()
  --     vim.g.everforest_enable_italic = true
  --    vim.g.everforest_background = "hard"
  --  end,
  -- },

  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").load()
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nordic",
    },
  },
}
