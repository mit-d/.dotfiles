{ pkgs, ... }:
let
  palette = import ../palettes/active.nix;
  colors = import ../palettes/lib.nix;

  # Tinted toward the editor background, so a diff line reads as "green, but
  # barely" instead of a block of colour behind the text.
  tint = t: color: colors.mix palette.surface color t;

  hl = groups: builtins.concatStringsSep "\n" (map (g: "        ${g},") groups);

  ansiSlots = [
    "black"
    "red"
    "green"
    "yellow"
    "blue"
    "magenta"
    "cyan"
    "white"
    "brightBlack"
    "brightRed"
    "brightGreen"
    "brightYellow"
    "brightBlue"
    "brightMagenta"
    "brightCyan"
    "brightWhite"
  ];

  terminalColors = builtins.concatStringsSep "\n      " (
    builtins.genList (
      i: ''vim.g.terminal_color_${toString i} = "${palette.ansi.${builtins.elemAt ansiSlots i}}"''
    ) 16
  );

  colorscheme = pkgs.writeText "nvim-palette-${palette.name}.lua" ''
    -- ${palette.displayName or palette.name}, generated from nix/palettes by
    -- nix/home/nvim.nix. Do not edit: rewritten on every switch.
    --
    -- A module with a setup() rather than a colors/ colorscheme file, because
    -- init.lua already calls setup() on one and this drops into that slot.
    local M = {}

    local c = {
      bg = "${palette.surface}",
      bg_dim = "${palette.surfaceContainerLowest}",
      bg_alt = "${palette.surfaceContainer}",
      bg_sel = "${palette.surfaceContainerHigh}",
      bg_hi = "${palette.surfaceContainerHighest}",

      fg = "${palette.onSurface}",
      fg_strong = "${palette.onSurfaceStrong}",
      fg_muted = "${palette.onSurfaceVariant}",
      fg_faint = "${palette.onSurfaceFaint}",

      border = "${palette.outlineVariant}",
      border_hi = "${palette.outline}",

      primary = "${palette.primary}",
      on_primary = "${palette.onPrimary}",
      primary_container = "${palette.primaryContainer}",
      error = "${palette.error}",
      cursor = "${palette.cursor}",

      red = "${palette.ansi.red}",
      green = "${palette.ansi.green}",
      yellow = "${palette.ansi.yellow}",
      blue = "${palette.ansi.blue}",
      magenta = "${palette.ansi.magenta}",
      cyan = "${palette.ansi.cyan}",
      orange = "${palette.orange}",

      -- Syntax roles, from base16's documented meanings for its accents. The
      -- same assignments are used by nix/home/jetbrains.nix, which is what makes
      -- a keyword the same colour in nvim as in the IDE.
      keyword = "${palette.ansi.magenta}", -- base0E: keywords, storage
      string = "${palette.ansi.green}", -- base0B: strings
      number = "${palette.orange}", -- base09: integers, constants
      func = "${palette.ansi.blue}", -- base0D: functions, methods
      type = "${palette.ansi.yellow}", -- base0A: classes, types
      variable = "${palette.ansi.red}", -- base08: variables, tags
      support = "${palette.ansi.cyan}", -- base0C: escapes, regex
      comment = "${palette.onSurfaceFaint}", -- base03: comments

      diff_add = "${tint 0.22 palette.ansi.green}",
      diff_change = "${tint 0.22 palette.ansi.blue}",
      diff_delete = "${tint 0.22 palette.error}",
      diff_text = "${tint 0.34 palette.ansi.blue}",
    }

    function M.setup()
      vim.cmd("hi clear")
      if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
      end

      vim.o.background = "${palette.variant}"
      vim.g.colors_name = "dotfiles"

      -- :terminal inside nvim, so a shell there matches one outside it.
      ${terminalColors}

      local highlights = {
        -- Editor
    ${hl [
      "Normal = { fg = c.fg, bg = c.bg }"
      "NormalNC = { fg = c.fg, bg = c.bg }"
      "NormalFloat = { fg = c.fg, bg = c.bg_alt }"
      "FloatBorder = { fg = c.border_hi, bg = c.bg_alt }"
      "FloatTitle = { fg = c.primary, bg = c.bg_alt, bold = true }"
      "Cursor = { fg = c.bg, bg = c.cursor }"
      "lCursor = { fg = c.bg, bg = c.cursor }"
      "TermCursor = { fg = c.bg, bg = c.cursor }"
      "CursorLine = { bg = c.bg_alt }"
      "CursorColumn = { bg = c.bg_alt }"
      "ColorColumn = { bg = c.bg_alt }"
      "LineNr = { fg = c.fg_faint }"
      "CursorLineNr = { fg = c.primary, bold = true }"
      "SignColumn = { fg = c.fg_faint, bg = c.bg }"
      "FoldColumn = { fg = c.fg_faint, bg = c.bg }"
      "Folded = { fg = c.fg_muted, bg = c.bg_alt }"
      "Visual = { bg = c.bg_sel }"
      "VisualNOS = { bg = c.bg_sel }"
      "Search = { fg = c.on_primary, bg = c.primary }"
      "IncSearch = { fg = c.on_primary, bg = c.primary_container }"
      "CurSearch = { fg = c.on_primary, bg = c.primary_container }"
      "Substitute = { fg = c.on_primary, bg = c.primary_container }"
      "MatchParen = { fg = c.primary, bg = c.bg_hi, bold = true }"
      "NonText = { fg = c.border }"
      "Whitespace = { fg = c.border }"
      "SpecialKey = { fg = c.border }"
      "EndOfBuffer = { fg = c.bg }"
      "Conceal = { fg = c.fg_faint }"
      "WinSeparator = { fg = c.border }"
      "VertSplit = { fg = c.border }"
      "Directory = { fg = c.blue }"
      "Title = { fg = c.primary, bold = true }"
      "Question = { fg = c.green }"
      "MoreMsg = { fg = c.green }"
      "ModeMsg = { fg = c.fg_strong, bold = true }"
      "ErrorMsg = { fg = c.error }"
      "WarningMsg = { fg = c.yellow }"
      "QuickFixLine = { bg = c.bg_sel }"
      "WildMenu = { fg = c.on_primary, bg = c.primary }"
    ]}

        -- Syntax
    ${hl [
      "Comment = { fg = c.comment, italic = true }"
      "Constant = { fg = c.number }"
      "String = { fg = c.string }"
      "Character = { fg = c.string }"
      "Number = { fg = c.number }"
      "Boolean = { fg = c.number }"
      "Float = { fg = c.number }"
      "Identifier = { fg = c.fg }"
      "Function = { fg = c.func }"
      "Statement = { fg = c.keyword }"
      "Conditional = { fg = c.keyword }"
      "Repeat = { fg = c.keyword }"
      "Label = { fg = c.keyword }"
      "Operator = { fg = c.fg }"
      "Keyword = { fg = c.keyword }"
      "Exception = { fg = c.keyword }"
      "PreProc = { fg = c.keyword }"
      "Include = { fg = c.keyword }"
      "Define = { fg = c.keyword }"
      "Macro = { fg = c.support }"
      "PreCondit = { fg = c.keyword }"
      "Type = { fg = c.type }"
      "StorageClass = { fg = c.keyword }"
      "Structure = { fg = c.type }"
      "Typedef = { fg = c.type }"
      "Special = { fg = c.support }"
      "SpecialChar = { fg = c.support }"
      "Tag = { fg = c.variable }"
      "Delimiter = { fg = c.fg }"
      "SpecialComment = { fg = c.fg_muted, italic = true }"
      "Debug = { fg = c.error }"
      "Underlined = { fg = c.blue, underline = true }"
      "Ignore = { fg = c.fg_faint }"
      "Error = { fg = c.error }"
      "Todo = { fg = c.bg, bg = c.yellow, bold = true }"
    ]}

        -- Popups, status, tabs
    ${hl [
      "Pmenu = { fg = c.fg, bg = c.bg_alt }"
      "PmenuSel = { fg = c.fg_strong, bg = c.bg_hi }"
      "PmenuKind = { fg = c.type, bg = c.bg_alt }"
      "PmenuKindSel = { fg = c.type, bg = c.bg_hi }"
      "PmenuExtra = { fg = c.fg_faint, bg = c.bg_alt }"
      "PmenuExtraSel = { fg = c.fg_muted, bg = c.bg_hi }"
      "PmenuSbar = { bg = c.bg_alt }"
      "PmenuThumb = { bg = c.border_hi }"
      "StatusLine = { fg = c.fg, bg = c.bg_alt }"
      "StatusLineNC = { fg = c.fg_faint, bg = c.bg_alt }"
      "TabLine = { fg = c.fg_muted, bg = c.bg_alt }"
      "TabLineFill = { bg = c.bg_alt }"
      "TabLineSel = { fg = c.fg_strong, bg = c.bg }"
      "WinBar = { fg = c.fg_muted, bg = c.bg }"
      "WinBarNC = { fg = c.fg_faint, bg = c.bg }"
    ]}

        -- Diff and git
    ${hl [
      "DiffAdd = { bg = c.diff_add }"
      "DiffChange = { bg = c.diff_change }"
      "DiffDelete = { fg = c.error, bg = c.diff_delete }"
      "DiffText = { bg = c.diff_text }"
      "diffAdded = { fg = c.green }"
      "diffRemoved = { fg = c.error }"
      "diffChanged = { fg = c.blue }"
      "diffFile = { fg = c.type }"
      "diffLine = { fg = c.fg_muted }"
      "GitSignsAdd = { fg = c.green }"
      "GitSignsChange = { fg = c.blue }"
      "GitSignsDelete = { fg = c.error }"
    ]}

        -- Diagnostics and LSP
    ${hl [
      "DiagnosticError = { fg = c.error }"
      "DiagnosticWarn = { fg = c.yellow }"
      "DiagnosticInfo = { fg = c.cyan }"
      "DiagnosticHint = { fg = c.blue }"
      "DiagnosticOk = { fg = c.green }"
      "DiagnosticUnderlineError = { sp = c.error, undercurl = true }"
      "DiagnosticUnderlineWarn = { sp = c.yellow, undercurl = true }"
      "DiagnosticUnderlineInfo = { sp = c.cyan, undercurl = true }"
      "DiagnosticUnderlineHint = { sp = c.blue, undercurl = true }"
      "DiagnosticVirtualTextError = { fg = c.error, bg = c.bg_alt }"
      "DiagnosticVirtualTextWarn = { fg = c.yellow, bg = c.bg_alt }"
      "DiagnosticVirtualTextInfo = { fg = c.cyan, bg = c.bg_alt }"
      "DiagnosticVirtualTextHint = { fg = c.blue, bg = c.bg_alt }"
      "LspReferenceText = { bg = c.bg_sel }"
      "LspReferenceRead = { bg = c.bg_sel }"
      "LspReferenceWrite = { bg = c.bg_hi }"
      "LspInlayHint = { fg = c.fg_faint, bg = c.bg_alt }"
      "LspSignatureActiveParameter = { fg = c.primary, bold = true }"
    ]}

        -- Tree-sitter
    ${hl [
      ''["@variable"] = { fg = c.fg }''
      ''["@variable.builtin"] = { fg = c.variable }''
      ''["@variable.parameter"] = { fg = c.fg }''
      ''["@variable.member"] = { fg = c.variable }''
      ''["@constant"] = { fg = c.number }''
      ''["@constant.builtin"] = { fg = c.number }''
      ''["@constant.macro"] = { fg = c.support }''
      ''["@module"] = { fg = c.type }''
      ''["@label"] = { fg = c.keyword }''
      ''["@string"] = { fg = c.string }''
      ''["@string.escape"] = { fg = c.support }''
      ''["@string.special"] = { fg = c.support }''
      ''["@character"] = { fg = c.string }''
      ''["@number"] = { fg = c.number }''
      ''["@boolean"] = { fg = c.number }''
      ''["@function"] = { fg = c.func }''
      ''["@function.builtin"] = { fg = c.support }''
      ''["@function.call"] = { fg = c.func }''
      ''["@function.method"] = { fg = c.func }''
      ''["@constructor"] = { fg = c.type }''
      ''["@keyword"] = { fg = c.keyword }''
      ''["@keyword.function"] = { fg = c.keyword }''
      ''["@keyword.return"] = { fg = c.keyword }''
      ''["@keyword.operator"] = { fg = c.keyword }''
      ''["@type"] = { fg = c.type }''
      ''["@type.builtin"] = { fg = c.type }''
      ''["@attribute"] = { fg = c.support }''
      ''["@property"] = { fg = c.variable }''
      ''["@operator"] = { fg = c.fg }''
      ''["@punctuation.delimiter"] = { fg = c.fg }''
      ''["@punctuation.bracket"] = { fg = c.fg }''
      ''["@punctuation.special"] = { fg = c.support }''
      ''["@comment"] = { fg = c.comment, italic = true }''
      ''["@comment.todo"] = { fg = c.bg, bg = c.yellow, bold = true }''
      ''["@comment.warning"] = { fg = c.bg, bg = c.orange, bold = true }''
      ''["@comment.error"] = { fg = c.bg, bg = c.error, bold = true }''
      ''["@tag"] = { fg = c.variable }''
      ''["@tag.attribute"] = { fg = c.number }''
      ''["@tag.delimiter"] = { fg = c.fg_muted }''
      ''["@markup.heading"] = { fg = c.primary, bold = true }''
      ''["@markup.link"] = { fg = c.blue, underline = true }''
      ''["@markup.link.url"] = { fg = c.support }''
      ''["@markup.raw"] = { fg = c.string }''
      ''["@markup.list"] = { fg = c.variable }''
      ''["@markup.strong"] = { bold = true }''
      ''["@markup.italic"] = { italic = true }''
      ''["@markup.strikethrough"] = { strikethrough = true }''
      ''["@diff.plus"] = { fg = c.green }''
      ''["@diff.minus"] = { fg = c.error }''
      ''["@diff.delta"] = { fg = c.blue }''
    ]}
      }

      for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
      end
    end

    return M
  '';
in
{
  # programs.neovim is deliberately not used: it generates its own init.lua,
  # which would collide with the hand-written one, and neovim already comes
  # from environment.systemPackages. Config-only, files linked individually
  # so ~/.config/nvim stays a real directory -- lazy.nvim needs to write
  # lazy-lock.json into it.
  xdg.configFile."nvim/init.lua".source = ../../vim/.config/nvim/init.lua;

  # Follows the active palette.
  xdg.configFile."nvim/lua/palette.lua".source = colorscheme;

  # Still linked, so init.lua's fallback is real rather than theoretical. It is
  # also what the Arch host stows, which is why init.lua cannot simply require
  # the generated module outright.
  xdg.configFile."nvim/lua/monokai_remastered.lua".source =
    ../../vim/.config/nvim/lua/monokai_remastered.lua;

  xdg.configFile."nvim/autoload/plug.vim".source = ../../vim/.config/nvim/autoload/plug.vim;
  xdg.configFile."nvim/plug.sh".source = ../../vim/.config/nvim/plug.sh;

  # lazy-lock.json is intentionally unmanaged -- lazy.nvim rewrites it on
  # every plugin update, so it cannot be a read-only store symlink.

  home.file.".vimrc".source = ../../vim/.vimrc;
}
