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
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    },
  },

  -- treesitter (configs module removed in new API; install + built-in highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
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
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "python", "javascript", "typescript", "lua", "bash", "yaml" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },

  -- LSP (nvim 0.11+: vim.lsp.config/enable replaces lspconfig.X.setup)
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", opts = {} },
      { "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = { "ruff" } } },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.lsp.config("ruff", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      vim.lsp.enable("ruff")
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

  -- markdown rendering (visual-only, no file changes)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
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

-- colorscheme (local lua/monokai_remastered.lua)
require("monokai_remastered").setup()
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
