-- Terminal-inspired Neovim colorscheme
local M = {}

-- Color palette based on terminal colors
local colors = {
  -- Base colors
  bg = "#0c0c0c",
  fg = "#d9d9d9",

  -- Terminal palette colors
  black = "#1a1a1a",
  red = "#f4005f",
  green = "#98e024",
  orange = "#fd971f",
  blue = "#9d65ff",
  magenta = "#f4005f",
  cyan = "#58d1eb",
  white = "#c4c5b5",

  -- Bright colors
  bright_black = "#625e4c",
  bright_red = "#f4005f",
  bright_green = "#98e024",
  bright_yellow = "#e0d561",
  bright_blue = "#9d65ff",
  bright_magenta = "#f4005f",
  bright_cyan = "#58d1eb",
  bright_white = "#f6f6ef",

  -- UI colors
  cursor = "#fc971f",
  cursor_text = "#000000",
  selection_bg = "#343434",
  selection_fg = "#ffffff",

  -- Additional derived colors
  comment = "#625e4c",
  line_number = "#625e4c",
  visual = "#343434",
}

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.background = "dark"
  vim.g.colors_name = "terminal_theme"

  local highlights = {
    -- Editor
    Normal = { fg = colors.fg, bg = colors.bg },
    NormalFloat = { fg = colors.fg, bg = colors.black },
    Cursor = { fg = colors.cursor_text, bg = colors.cursor },
    CursorLine = { bg = colors.black },
    CursorColumn = { bg = colors.black },
    LineNr = { fg = colors.line_number },
    CursorLineNr = { fg = colors.orange, bold = true },
    Visual = { bg = colors.visual },
    VisualNOS = { bg = colors.visual },
    Search = { fg = colors.black, bg = colors.bright_yellow },
    IncSearch = { fg = colors.black, bg = colors.orange },

    -- Syntax
    Comment = { fg = colors.comment, italic = true },
    Constant = { fg = colors.magenta },
    String = { fg = colors.green },
    Character = { fg = colors.green },
    Number = { fg = colors.magenta },
    Boolean = { fg = colors.magenta },
    Float = { fg = colors.magenta },

    Identifier = { fg = colors.cyan },
    Function = { fg = colors.blue },

    Statement = { fg = colors.red },
    Conditional = { fg = colors.red },
    Repeat = { fg = colors.red },
    Label = { fg = colors.red },
    Operator = { fg = colors.red },
    Keyword = { fg = colors.red },
    Exception = { fg = colors.red },

    PreProc = { fg = colors.orange },
    Include = { fg = colors.red },
    Define = { fg = colors.red },
    Macro = { fg = colors.blue },
    PreCondit = { fg = colors.red },

    Type = { fg = colors.cyan },
    StorageClass = { fg = colors.red },
    Structure = { fg = colors.cyan },
    Typedef = { fg = colors.cyan },

    Special = { fg = colors.orange },
    SpecialChar = { fg = colors.orange },
    Tag = { fg = colors.red },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment },
    Debug = { fg = colors.red },

    -- UI Elements
    Pmenu = { fg = colors.fg, bg = colors.black },
    PmenuSel = { fg = colors.bright_white, bg = colors.bright_black },
    PmenuSbar = { bg = colors.bright_black },
    PmenuThumb = { bg = colors.white },

    StatusLine = { fg = colors.white, bg = colors.bright_black },
    StatusLineNC = { fg = colors.comment, bg = colors.black },

    TabLine = { fg = colors.comment, bg = colors.black },
    TabLineFill = { bg = colors.black },
    TabLineSel = { fg = colors.bright_white, bg = colors.bright_black },

    -- Git
    DiffAdd = { fg = colors.green },
    DiffChange = { fg = colors.orange },
    DiffDelete = { fg = colors.red },
    DiffText = { fg = colors.bright_yellow, bg = colors.bright_black },

    -- Diagnostics
    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = colors.orange },
    DiagnosticInfo = { fg = colors.cyan },
    DiagnosticHint = { fg = colors.blue },

    -- Tree-sitter
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.magenta },
    ["@constant"] = { fg = colors.magenta },
    ["@constant.builtin"] = { fg = colors.magenta },
    ["@string"] = { fg = colors.green },
    ["@number"] = { fg = colors.magenta },
    ["@boolean"] = { fg = colors.magenta },
    ["@function"] = { fg = colors.blue },
    ["@function.builtin"] = { fg = colors.cyan },
    ["@keyword"] = { fg = colors.red },
    ["@type"] = { fg = colors.cyan },
    ["@comment"] = { fg = colors.comment, italic = true },
  }

  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
