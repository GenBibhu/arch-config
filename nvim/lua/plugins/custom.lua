-- In lua/plugins/custom.lua
return {
  -- Add transparency support
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        enable = true,
        extra_groups = {
          "NormalFloat",
          "NvimTreeNormal",
          "TelescopeNormal",
        },
      })
    end,
  },

  -- Add minimap support
  {
    "gorbit99/codewindow.nvim",
    event = "BufReadPost",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        auto_enable = true,
        width = 22,
        symbols = {
          hint = "H",
          info = "I",
          warning = "!",
          error = "X",
        },
      })
      -- Toggle minimap with leader + m
      vim.keymap.set("n", "<leader>m", function()
        codewindow.toggle_minimap()
      end, { desc = "Toggle Minimap" })
    end,
  },

  -- Updated conda environment support with new venv-selector version and dynamic paths
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp", -- Use the new 2024 version
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local home = vim.fn.expand("$HOME")
      require("venv-selector").setup({
        -- Dynamic paths using $HOME
        anaconda_base_path = home .. "/anaconda3",
        anaconda_envs_path = home .. "/anaconda3/envs",
        -- Additional search paths using dynamic home directory
        search_paths = {
          home .. "/anaconda3/envs",
          home .. "/.conda/envs",
        },
        -- Use the new search API
        search = {
          -- Include conda environments
          conda = true,
          -- Include venv environments
          venv = true,
          -- Include poetry environments
          poetry = false,
          -- Include pipenv environments
          pipenv = false,
        },
        -- Automatically change the environment when opening a python file
        auto_change = false,
        -- Change the environment when changing directories
        change_on_dir_change = false,
        -- Show additional environment info
        notify_user_on_activate = true,
        -- Additional LSP configurations
        parents = 2, -- Number of parent directories to search
        -- Name of the file to look for when searching poetry/pipenv environments
        enable_debug_output = false,
      })

      -- Keybindings for venv-selector
      vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Select Virtualenv" })
      vim.keymap.set("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { desc = "Select Cached Virtualenv" })
      vim.keymap.set("n", "<leader>vd", "<cmd>VenvSelectDelete<cr>", { desc = "Delete Virtualenv" })
    end,
  },

  -- [Rest of the configuration remains the same...]
  -- Enhanced Python support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        },
      },
    },
  },

  -- Add better terminal support
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 0,
          highlights = {
            border = "Normal",
            background = "Normal",
          },
        },
      })
    end,
  },

  -- Add indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = true },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },

  -- Override colorscheme with Catppuccin (works well with transparency)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          -- Make function names neon
          ["@function"] = { fg = "#00ff9f" }, -- Bright neon green
          ["@function.call"] = { fg = "#00ff9f" },
          ["@method"] = { fg = "#00ff9f" },
          ["@method.call"] = { fg = "#00ff9f" },

          -- Enhance other syntax elements
          ["@keyword"] = { fg = "#ff00ff" }, -- Bright magenta
          ["@string"] = { fg = "#ffa500" }, -- Bright orange
          ["@variable"] = { fg = "#00ffff" }, -- Bright cyan
          ["@parameter"] = { fg = "#ff9500" }, -- Bright coral
          ["@type"] = { fg = "#ff47ff" }, -- Bright pink
          ["@constant"] = { fg = "#ffff00" }, -- Bright yellow

          -- Make comments more visible against transparent background
          ["@comment"] = { fg = "#888888", style = { "italic" } },
        }
      end,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = true,
        notify = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "html",
        "css",
        "bash",
        "markdown",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
