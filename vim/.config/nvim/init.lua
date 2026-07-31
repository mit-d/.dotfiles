-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Disable netrw (recommended by nvim-tree; must run before plugins load)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Base settings from .vimrc
vim.cmd("source ~/.vimrc")
vim.opt.laststatus = 2 -- lualine needs >=2

require("lazy").setup({
  -- editor
  "tpope/vim-sleuth",
  "tpope/vim-commentary",
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- git
  { "lewis6991/gitsigns.nvim", opts = {} },
  "sindrets/diffview.nvim",

  -- ui
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { options = { theme = "auto" } },
  },

  -- fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>d", "<cmd>Telescope diagnostics<cr>", desc = "All diagnostics" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })
      require("telescope").load_extension("fzf")
    end,
  },

  -- treesitter (configs module removed in new API; install + built-in highlighting)
  {
    "neovim-treesitter/nvim-treesitter",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "markdown",
        "markdown_inline",
        "lua",
        "python",
        "bash",
        "javascript",
        "yaml",
        "typescript",
        "html",
        "scss",
        "css",
        "angular",
        "csv",
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "markdown",
          "python",
          "javascript",
          "typescript",
          "lua",
          "bash",
          "yaml",
          "html",
          "htmlangular",
          "scss",
          "css",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
      -- Treat Angular component templates as htmlangular for Angular-aware parsing
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.component.html",
        callback = function()
          vim.bo.filetype = "htmlangular"
        end,
      })
    end,
  },

  -- LSP (nvim 0.11+: vim.lsp.config/enable replaces lspconfig.X.setup)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "ruff",
            "lua_ls",
            "ts_ls",
            "angularls",
            "bashls",
            "yamlls",
            "html",
            "cssls",
          },
        },
      },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = {
        ruff = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        ts_ls = {},
        angularls = {},
        bashls = {},
        yamlls = {},
        html = {},
        cssls = {},
      }
      for name, cfg in pairs(servers) do
        cfg.capabilities = capabilities
        vim.lsp.config(name, cfg)
        vim.lsp.enable(name)
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("gr", vim.lsp.buf.references, "References")
          map("K", vim.lsp.buf.hover, "Hover")
          map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>cf", function()
            vim.lsp.buf.format({ async = true })
          end, "Format buffer")
          map("<leader>cF", function()
            vim.lsp.buf.code_action({
              context = { only = { "source.fixAll" }, diagnostics = {} },
              apply = true,
            })
          end, "Fix all (LSP)")
          map("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
          map("[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, "Prev diagnostic")
          map("]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, "Next diagnostic")
        end,
      })
    end,
  },

  -- completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, { name = "luasnip" } },
          { { name = "buffer" }, { name = "path" } }
        ),
      })
    end,
  },

  -- file explorer (edit filesystem as a buffer)
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      view_options = { show_hidden = true },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
  },

  -- file explorer (tree sidebar)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file tree" },
      { "<leader>fe", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Reveal file in tree" },
    },
    opts = {
      view = { width = 35 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
      update_focused_file = { enable = true },
    },
  },

  -- csv viewer
  {
    "hat0uma/csvview.nvim",
    cmd = { "CsvViewToggle", "CsvViewEnable", "CsvViewDisable" },
    opts = { view = { display_mode = "highlight" } },
    keys = {
      { "<leader>cv", "<cmd>CsvViewToggle<cr>", desc = "Toggle CSV view" },
    },
  },

  -- markdown rendering (visual-only, no file changes)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "neovim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    opts = {},
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npx --yes yarn install",
    ft = { "markdown" },
  },
})

-- colorscheme
--
-- lua/palette.lua is generated from nix/palettes by nix/home/nvim.nix, so nvim
-- follows the same palette as the terminal, browser and IDEs. It only exists on
-- hosts built with nix; the Arch box stows this file without it, so fall back to
-- the checked-in module there rather than erroring at startup.
local ok_palette, palette_scheme = pcall(require, "palette")
if ok_palette then
  palette_scheme.setup()
else
  require("monokai_remastered").setup()
end
vim.cmd("highlight Normal guibg=none")
vim.cmd("highlight NonText guibg=none")

-- format python on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- close diffview before quit to avoid E21 on non-modifiable buffers
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local ft = vim.bo.filetype
    if ft == "DiffviewFiles" or ft == "DiffviewFileHistory" then
      vim.cmd("tabclose")
    end
  end,
})
