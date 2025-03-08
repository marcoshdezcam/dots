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
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_vivid",
    },
  },
}
