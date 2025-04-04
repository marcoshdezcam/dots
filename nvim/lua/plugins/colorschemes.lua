return {
  {
    "sainnhe/everforest",
    lazy = true,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = "hard"
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = true,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.cmd.colorscheme("sonokai")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
  },
  {
    "mhartington/oceanic-next",
  },
  {
    "oxfist/night-owl.nvim",
    lazy = true,
    config = function()
      require("night-owl").setup({
        bold = true,
        italics = true,
        underline = true,
        undercurl = true,
        transparent_background = false,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
