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
    "rebelot/kanagawa.nvim",
    lazy = true,
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
  },
  {
    "olimorris/onedarkpro.nvim",
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    config = function()
      require("cyberdream").setup({
        -- Set light or dark variant
        variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
        -- Enable transparent background
        transparent = false,
        -- Reduce the overall saturation of colours for a more muted look
        saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)
        -- Enable italics comments
        italic_comments = false,
        -- Replace all fillchars with ' ' for the ultimate clean look
        hide_fillchars = false,
        -- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
        borderless_pickers = false,
        -- Set terminal colors used in `:terminal`
        terminal_colors = true,
        -- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
        cache = false,
        -- Override highlight groups with your own colour values
        highlights = {
          -- Highlight groups to override, adding new groups is also possible
          -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values
          -- Example:
          Comment = { fg = "#696969", bg = "NONE", italic = true },
          -- More examples can be found in `lua/cyberdream/extensions/*.lua`
        },
        -- Override a highlight group entirely using the built-in colour palette
        overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
          -- Example:
          return {
            Comment = { fg = colors.green, bg = "NONE", italic = true },
            ["@property"] = { fg = colors.magenta, bold = true },
          }
        end,
        -- Override a color entirely
        colors = {
          -- For a list of colors see `lua/cyberdream/colours.lua`
          -- Example:
          bg = "#000000",
          green = "#00ff00",
          magenta = "#ff00ff",
        },
        -- Disable or enable colorscheme extensions
        extensions = {
          telescope = true,
          notify = true,
          mini = true,
        },
      })
    end,
  },
  {
    "mhartington/oceanic-next",
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
    config = function()
      require("material").setup({
        contrast = {
          terminal = false, -- Enable contrast for the built-in terminal
          sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
          floating_windows = false, -- Enable contrast for floating windows
          cursor_line = false, -- Enable darker background for the cursor line
          lsp_virtual_text = false, -- Enable contrasted background for lsp virtual text
          non_current_windows = false, -- Enable contrasted background for non-current windows
          filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
        },
        styles = { -- Give comments style such as bold, italic, underline etc.
          comments = { --[[ italic = true ]]
          },
          strings = { --[[ bold = true ]]
          },
          keywords = { --[[ underline = true ]]
          },
          functions = { --[[ bold = true, undercurl = true ]]
          },
          variables = {},
          operators = {},
          types = {},
        },
        plugins = { -- Uncomment the plugins that you use to highlight them
          -- Available plugins:
          -- "coc",
          -- "colorful-winsep",
          -- "dap",
          -- "dashboard",
          -- "eyeliner",
          -- "fidget",
          -- "flash",
          -- "gitsigns",
          -- "harpoon",
          -- "hop",
          -- "illuminate",
          -- "indent-blankline",
          -- "lspsaga",
          -- "mini",
          -- "neogit",
          -- "neotest",
          -- "neo-tree",
          -- "neorg",
          -- "noice",
          -- "nvim-cmp",
          -- "nvim-navic",
          -- "nvim-tree",
          -- "nvim-web-devicons",
          -- "rainbow-delimiters",
          -- "sneak",
          -- "telescope",
          -- "trouble",
          -- "which-key",
          -- "nvim-notify",
        },
        disable = {
          colored_cursor = false, -- Disable the colored cursor
          borders = false, -- Disable borders between vertically split windows
          background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
          term_colors = false, -- Prevent the theme from setting terminal colors
          eob_lines = false, -- Hide the end-of-buffer lines
        },
        high_visibility = {
          lighter = false, -- Enable higher contrast text for lighter style
          darker = false, -- Enable higher contrast text for darker style
        },
        lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )
        async_loading = true, -- Load parts of the theme asynchronously for faster startup (turned on by default)
        custom_colors = nil, -- If you want to override the default colors, set this to a function
        custom_highlights = {}, -- Overwrite highlights with your own
      })
    end,
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false,
    priority = 1000,
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
      colorscheme = "night-owl",
    },
  },
}
