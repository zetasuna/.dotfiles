-- https://github.com/echasnovski/nvim/blob/master/init.lua
-- https://github.com/pkazmier/nvim/blob/main/init.lua
-- https://gitlab.com/domsch1988/mvim/-/blob/main/init.lua
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ Initialization   ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
require("mini.deps").setup({ path = { package = path_package } })
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local advanced_filetype = {
  "sh",
  "fish",
  "awk",
  "vim",
  "lua",
  "perl",
  "python",
  "asm",
  "c",
  "make",
  "cmake",
  "nix",
  "dockerfile",
  "go",
  "html",
  "css",
  "javascript",
  "sql",
  "json",
  "xml",
  "yaml",
}
-- ┏━━━━━━━━━━━━━━━━━━┓
-- ┃ Config + Plugins ┃
-- ┗━━━━━━━━━━━━━━━━━━┛
now(function() -- Custom for Neovim
  vim.cmd("filetype plugin indent on")
  vim.g.mapleader = " " -- Mapleader
  vim.g.maplocalleader = " " -- Local Mapleader
  vim.opt.termguicolors = true -- Enable GUI colors
  vim.opt.clipboard = "unnamed,unnamedplus" -- Clipboard
  -- vim.opt.spelllang = 'en_us, uk'  -- Define spelling dictionaries
  -- vim.opt.spelloptions = 'camel'  -- Treat parts of camelCase words as seprate words
  -- vim.opt.complete:append('kspell')  -- Add spellcheck options for autocomplete
  -- vim.opt.dictionary = vim.fn.stdpath('config') .. '/misc/dict/english.txt' -- Use specific dictionaries
  vim.opt.complete:remove("t") -- Don't use tags for completion
  vim.opt.completeopt = "menuone,preview,noinsert,noselect,fuzzy" -- A comma-separated list of options for Insert mode completion ins-completion.
  vim.opt.confirm = true -- Ask when write....
  vim.opt.encoding = "utf-8" -- Set encoding
  vim.opt.mouse = "a" -- Enable mouse
  vim.opt.mousescroll = "ver:1,hor:1" -- Needed for mini.animate to work with mouse scrolling
  vim.opt.scrolloff = 0 -- Scroll line (With mouse)
  vim.opt.undofile = true -- [I don't know why set this cause slowly startup Neovim]
  vim.opt.backup = false -- Don't store backup
  vim.opt.writebackup = false -- Don't store backup
  vim.opt.number = true -- Relative Number
  vim.opt.relativenumber = true -- Relative Number
  vim.opt.autoindent = true -- Use auto indent
  vim.opt.breakindent = true -- Indent wrapped lines to match line start
  vim.opt.breakindentopt = "list:-1" -- Add padding for lists when 'wrap' is on
  vim.opt.smartindent = true -- Make indenting smart
  vim.opt.virtualedit = "block" -- Allow going past the end of line in visual block mode
  vim.opt.cursorline = true -- Enable Highlight Cursor Line
  vim.opt.cursorlineopt = "number,screenline" -- Show cursor line only screen line when wrapped
  vim.opt.cursorcolumn = false -- Don't Highlight Cursor Column
  vim.opt.foldcolumn = "0" -- Disable foldcolumn
  vim.opt.foldmethod = "indent" -- Set folding method
  vim.opt.foldlevel = 0 -- Display folding [Higher numbers will close fewer folds]
  vim.opt.foldnestmax = 10 -- Create folds only for some number of nested levels
  vim.opt.foldtext = "" -- Use underlying text with its highlighting
  vim.opt.signcolumn = "auto" -- Show signcolumn or it would frequently shift when needed
  vim.opt.cmdheight = 0 -- Set height of Cmd
  vim.opt.pumheight = 10 -- Make popup menu smaller
  vim.opt.pumblend = 0 -- Make builtin completion menus slightly transparent
  vim.opt.winblend = 0 -- Make floating windows slightly transparent
  vim.opt.ruler = false -- Not show Ruler
  vim.opt.showmode = false -- Not show mode: --INSERT--,...
  vim.opt.showcmd = true -- Show (partial) command in the last line of the screen
  vim.opt.showtabline = 0 -- Not show tabline
  vim.opt.hlsearch = true -- Highlight search result
  vim.opt.incsearch = true -- Show search results while typing
  vim.opt.infercase = true -- Infer letter cases for a richer built-in keyword completion
  vim.opt.ignorecase = true -- Ignore case when searching (use `\C` to force not doing that)
  vim.opt.smartcase = true -- Don't ignore case when searching if pattern has upper case
  vim.opt.expandtab = true -- Convert tabs to spaces
  vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
  vim.opt.shiftwidth = 2 -- Use this number of spaces for indentation
  vim.opt.tabstop = 2 -- Insert x spaces for a tab
  vim.opt.wildmenu = true
  vim.opt.wildmode = "full"
  vim.opt.wildoptions = ""
  vim.opt.wrap = false -- Display long lines as just one line
  vim.opt.formatoptions = "rqnl1j" -- Improve comment editing
  vim.opt.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
  vim.opt.sessionoptions = { "buffers", "curdir", "folds", "globals", "help", "skiprtp", "tabpages", "winsize" }
  vim.opt.shortmess = "soOtTF" -- Disable certain messages from |ins-completion-menu|
  vim.opt.iskeyword:append("-") -- Treat dash separated words as a word text object
  vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
  vim.opt.splitkeep = "screen" -- Reduce scroll during window split
  vim.opt.splitbelow = true -- Horizontal splits will be below
  vim.opt.splitright = true -- Vertical splits will be to the right
  vim.opt.list = true -- Show helpful character indicators
  vim.opt.listchars = { tab = "❱ ", trail = "", extends = "󰄾", precedes = "󰄽", nbsp = "␣" } -- Only display when wrap = false
  vim.opt.fillchars = "vert:║,vertleft:╣,vertright:╠,verthoriz:╬,horiz:═,horizup:╩,horizdown:╦"
  -- [[ autocommands ]]=================================================
  vim.api.nvim_create_autocmd("TermEnter", {
    callback = function()
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
    end,
  })
  -- [[ Keybindings ]]==================================================
  local nmap_leader = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set("n", "<Leader>" .. suffix, rhs, opts)
  end
  local xmap_leader = function(suffix, rhs, desc, opts)
    opts = opts or {}
    opts.desc = desc
    vim.keymap.set("x", "<Leader>" .. suffix, rhs, opts)
  end
  -- stylua: ignore start
  -- b is for 'buffer'
  nmap_leader('ba', '<Cmd>b#<CR>',                                 '[a]lternate')
  nmap_leader('bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>',  '[D]elete unsaved')
  nmap_leader('bd', '<Cmd>lua MiniBufremove.delete()<CR>',         '[d]elete')
  nmap_leader('be', '<Cmd>%bd|e#|bd#<CR>',                         '[e]liminate other buffers')
  nmap_leader('bu', '<Cmd>lua MiniBufremove.unshow()<CR>',         '[u]nshow')
  nmap_leader('bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', '[W]ipeout unsaved')
  nmap_leader('bw', '<Cmd>lua MiniBufremove.wipeout()<CR>',        '[w]ipeout')
  -- d is for 'Deps'
  nmap_leader("da", "<Cmd>DepsAdd<CR>",           "Deps [a]dd")
  nmap_leader("dc", "<Cmd>DepsClean<CR>",         "Deps [c]lean")
  nmap_leader("dl", "<Cmd>DepsShowLog<CR>",       "Deps [l]og")
  nmap_leader("dS", "<Cmd>DepsSnapLoad<CR>",      "Deps [S]nap load")
  nmap_leader("ds", "<Cmd>DepsSnapSave<CR>",      "Deps [s]nap save")
  nmap_leader("dU", "<Cmd>DepsUpdateOffline<CR>", "Deps [U]pdate offline")
  nmap_leader("du", "<Cmd>DepsUpdate<CR>",        "Deps [u]pdate")
  -- f is for 'files'
  nmap_leader('fC', '<Cmd>edit $MYVIMRC<CR>',                                                                 '[C]onfig file edit')
  nmap_leader('fc', '<Cmd>lua MiniFiles.open(vim.fn.stdpath("config"))<CR>',                                  '[c]onfig directory')
  nmap_leader('fD', '<Cmd>lua MiniFiles.open()<CR>',                                                          '[D]irectory of pwd')
  nmap_leader('fd', '<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>',                              '[d]irectory of current file')
  nmap_leader('fm', '<Cmd>lua MiniFiles.open(vim.fn.stdpath("data").."/site/pack/deps/start/mini.nvim")<CR>', '[m]ini.nvim directory')
  nmap_leader('fp', '<Cmd>lua MiniFiles.open(vim.fn.stdpath("data").."/site/pack/deps/opt")<CR>',             '[p]lugins directory')
  -- g is for git
  nmap_leader('gb', '<Cmd>Git blame -- %<CR>',                  '[b]lame')
  nmap_leader('gC', '<Cmd>Git commit --amend<CR>',              '[C]ommit amend')
  nmap_leader('gc', '<Cmd>Git commit<CR>',                      '[c]ommit')
  nmap_leader('gH', '<Cmd>Git hist --all<CR>',                  '[H]istory workspace')
  nmap_leader('gh', '<Cmd>Git hist<CR>',                        '[h]istory buffer')
  nmap_leader('gL', '<Cmd>Git log --oneline<CR>',               '[L]og workspace')
  nmap_leader('gl', '<Cmd>Git log --oneline --follow -- %<CR>', '[l]og buffer')
  nmap_leader('gs', '<Cmd>lua MiniGit.show_at_cursor()<CR>',    '[s]how at cursor')
  xmap_leader('s', '<Cmd>lua MiniGit.show_at_cursor()<CR>',    '[s]how at selection')
  -- l is for 'LSP' (Language Server Protocol)
  local formatting_cmd = '<Cmd>lua require("conform").format({ lsp_fallback = true })<CR>'
  xmap_leader('b', formatting_cmd,                              '[b]eautify selection')
  nmap_leader('lb', formatting_cmd,                              '[b]eautify')
  nmap_leader('lc', '<Cmd>lua vim.lsp.buf.code_action()<CR>',    '[c]ode action')
  nmap_leader('ld', '<Cmd>lua vim.lsp.buf.definition()<CR>',     '[d]efinition')
  nmap_leader('lf', '<Cmd>lua vim.diagnostic.open_float()<CR>',  '[f]loating')
  nmap_leader('lg', '<Cmd>lua vim.lsp.buf.rename()<CR>',         '[g]ive new name (rename)')
  nmap_leader('lh', '<Cmd>lua vim.lsp.buf.hover()<CR>',          '[h]over')
  nmap_leader('li', '<Cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>', '[i]nlay hint')
  nmap_leader('ll', '<Cmd>lua vim.diagnostic.setloclist()<CR>',  '[l]oclist')
  nmap_leader('ln', '<Cmd>lua vim.diagnostic.goto_next()<CR>',   '[n]ext diagnostic')
  nmap_leader('lp', '<Cmd>lua vim.diagnostic.goto_prev()<CR>',   '[p]rev diagnostic')
  nmap_leader('lr', '<Cmd>lua vim.lsp.buf.references()<CR>',     '[r]eferences')
  nmap_leader('ls', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', '[s]ignature')
  -- m is for 'map'
  nmap_leader('mc', '<Cmd>lua MiniMap.close()<CR>',        '[c]lose')
  nmap_leader('mf', '<Cmd>lua MiniMap.toggle_focus()<CR>', '[f]ocus toggle')
  nmap_leader('mo', '<Cmd>lua MiniMap.open()<CR>',         '[o]pen')
  nmap_leader('mr', '<Cmd>lua MiniMap.refresh()<CR>',      '[r]efresh')
  nmap_leader('ms', '<Cmd>lua MiniMap.toggle_side()<CR>',  '[s]ide toggle')
  nmap_leader('mt', '<Cmd>lua MiniMap.toggle()<CR>',       '[t]oggle')
  -- v is for 'visits'
  nmap_leader('vA', '<Cmd>lua MiniVisits.add_label("core")<CR>',    '[A]dd "core" label')
  nmap_leader('va', '<Cmd>lua MiniVisits.add_label()<CR>',          '[a]dd label')
  nmap_leader('vR', '<Cmd>lua MiniVisits.remove_label("core")<CR>', '[R]emove "core" label')
  nmap_leader('vr', '<Cmd>lua MiniVisits.remove_label()<CR>',       '[r]emove label')
  -- \ is for 'toggle'
  local trailspace_toggle_command = '<Cmd>lua vim.b.minitrailspace_disable = not vim.b.minitrailspace_disable<CR>'
  vim.keymap.set("n", "\\a", '<Cmd>lua MiniCursorword.toggle()<CR>', { desc = 'Toggle Cursor word highlight' })
  vim.keymap.set("n", "\\R", '<Cmd>lua MiniMisc.resize_window()<CR>', { desc = '[R]esize to default width' })
  vim.keymap.set("n", "\\S", '<Cmd>lua MiniSessions.select()<CR>',    { desc = '[S]ession select' })
  vim.keymap.set("n", "\\H", '<Cmd>TSBufToggle highlight<CR>',        { desc = 'Toggle Treesitter highlight' })
  vim.keymap.set("n", "\\T", '<Cmd>lua MiniTrailspace.trim()<CR>',    { desc = '[T]rim trailspace' })
  vim.keymap.set("n", "\\t", trailspace_toggle_command,               { desc = "Toggle 'Trailspace'" })
  vim.keymap.set("n", "\\Z", '<Cmd>lua MiniMisc.zoom()<CR>',          { desc = '[Z]oom' })
  vim.keymap.set("n", "\\<", '<Cmd>normal gxiagxila<CR>',             { desc = 'Move arg left' })
  vim.keymap.set("n", "\\>", '<Cmd>normal gxiagxina<CR>',             { desc = 'Move arg right' })
  vim.keymap.set("n", "\\[", '<Cmd>belowright terminal<CR>',          { desc = 'Terminal horizontal' })
  vim.keymap.set("n", "\\]", '<Cmd>vertical terminal<CR>',            { desc = 'Terminal vertical' })
  -- ===================================================================
  nmap_leader('BB', '<Cmd>Pick buffers<CR>',                                '[B]uffers')
  nmap_leader('BL', '<Cmd>Pick buf_lines scope="all"<CR>',                  '[L]ines in workspace')
  nmap_leader('Bl', '<Cmd>Pick buf_lines scope="current"<CR>',              '[l]ines in buffer')
  nmap_leader('GA', '<Cmd>Pick git_hunks scope="staged"<CR>',               '[A]dded git hunks workspace')
  nmap_leader('Ga', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>',      '[a]dded git hunks buffer')
  nmap_leader('GC', '<Cmd>Pick git_commits<CR>',                            '[C]ommits workspace')
  nmap_leader('Gc', '<Cmd>Pick git_commits path="%"<CR>',                   '[c]ommits buffer')
  nmap_leader('Gd', '<Cmd>Pick git_files scope="deleted"<CR>',              '[d]eleted git files')
  nmap_leader('GH', '<Cmd>Pick git_hunks<CR>',                              '[H]unks modified workspace')
  nmap_leader('Gh', '<Cmd>Pick git_hunks path="%"<CR>',                     '[h]unks modified buffer')
  nmap_leader('Gi', '<Cmd>Pick git_files scope="ignored"<CR>',              '[i]gnored git files')
  nmap_leader('Gm', '<Cmd>Pick git_files scope="modified"<CR>',             '[m]odified git files')
  nmap_leader('Gt', '<Cmd>Pick git_files<CR>',                              '[t]racked git files')
  nmap_leader('Gu', '<Cmd>Pick git_files scope="untracked"<CR>',            '[u]ntracked git files')
  nmap_leader('FF', '<Cmd>Pick files<CR>',                                  '[F]uzzy find file')
  nmap_leader('Ff', '<Cmd>Pick oldfiles<CR>',                               '[f]uzzy find file old')
  nmap_leader('LC', '<Cmd>Pick diagnostic scope="all"<CR>',                 '[C]hecking workspace')
  nmap_leader('Lc', '<Cmd>Pick diagnostic scope="current"<CR>',             '[c]hecking buffer')
  nmap_leader('LD', '<Cmd>Pick lsp scope="declaration"<CR>',                '[D]eclaration')
  nmap_leader('Ld', '<Cmd>Pick lsp scope="definition"<CR>',                 '[d]efinition')
  nmap_leader('Li', '<Cmd>Pick lsp scope="implementation"<CR>',             '[i]mplementation')
  nmap_leader('Lr', '<Cmd>Pick lsp scope="references"<CR>',                 '[r]eferences')
  nmap_leader('LS', '<Cmd>Pick lsp scope="workspace_symbol"<CR>',           '[S]ymbol workspace')
  nmap_leader('Ls', '<Cmd>Pick lsp scope="document_symbol"<CR>',            '[s]ymbol document')
  nmap_leader('Lt', '<Cmd>Pick lsp scope="type_definition"<CR>',            '[t]ype_definition')
  nmap_leader('Vl', '<Cmd>Pick visit_labels<CR>',                           '[l]abel visit')
  nmap_leader('VP', '<Cmd>Pick visit_paths cwd=""<CR>',                     '[P]aths visit (all)')
  nmap_leader('Vp', '<Cmd>Pick visit_paths<CR>',                            '[p]aths visit (cwd)')
  nmap_leader('/l', '<Cmd>Pick grep_live<CR>',                              '[l]ive grep')
  nmap_leader('/P', '<Cmd>Pick grep pattern="(TODO|FIXME|HACK|NOTE):"<CR>', '[P]attern grep TODO|FIXME|HACK|NOTE')
  nmap_leader('/p', '<Cmd>Pick grep pattern="<cword>"<CR>',                 '[p]attern grep word')
  nmap_leader('/R', '<Cmd>Pick resume<CR>',                                 '[R]esume')
  nmap_leader('/r', '<Cmd>Pick registers<CR>',                              '[r]egisters')
  nmap_leader('/s', '<Cmd>Pick spellsuggest<CR>',                           '[s]pell suggestions')
  nmap_leader('/t', '<Cmd>Pick treesitter<CR>',                             '[t]reesitter')
  nmap_leader('//', '<Cmd>Pick history scope="/"<CR>',                      '[/] history')
  nmap_leader('/:', '<Cmd>Pick history scope=":"<CR>',                      '[:] history')
  nmap_leader('?c', '<Cmd>Pick commands<CR>',                               '[c]ommand')
  nmap_leader('?h', '<Cmd>Pick help<CR>',                                   '[h]elp neovim')
  nmap_leader('?H', '<Cmd>Pick hl_groups<CR>',                              '[H]ighlight groups')
  nmap_leader('?k', '<Cmd>Pick keymaps<CR>',                                '[k]eymaps neovim')
  nmap_leader('?o', '<Cmd>Pick options<CR>',                                '[o]ptions neovim')
  nmap_leader('?r', '<Cmd>Pick registry<CR>',                               '[r]egistry mini.pick')
  -- stylua: ignore end
end)
now(function() -- Initialization
  -- [[ Dracula Theme ]]================================================
  add("Mofiqul/dracula.nvim")
  local colors = {
    bg = "#282A36",
    bgdark = "#21222C",
    bgdarker = "#191a21",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
  }
  require("dracula").setup({
    colors = {},
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    transparent_bg = false, -- default false
    lualine_bg_color = "#282a36", -- default nil
    italic_comment = false, -- default false
    -- overrides the default highlights with table see `:h synIDattr`
    overrides = function(colors)
      return {
        Normal = { fg = colors.fg },
        StatusLine = { fg = colors.purple },
        WildMenu = { bg = colors.purple, fg = colors.bg },
        QuickFixLine = { bg = colors.orange, fg = colors.bg },
        CursorLineNr = { fg = colors.purple, bold = 1 },
        CurSearch = { bg = colors.green, fg = colors.bg },
        IncSearch = { bg = colors.orange, fg = colors.bg },
        DiffAdd = { fg = colors.green },
        Folded = { fg = colors.purple, bold = 1 },
        WinSeparator = { fg = colors.purple, bold = 1 },
        MatchParen = { fg = colors.green, standout = 1 },
        Visual = { bg = colors.purple, fg = colors.bg },
        SnippetTabstop = { bg = colors.orange, fg = colors.bg },
        MsgSeparator = { bg = colors.bg },
        MsgArea = { fg = colors.green, bold = 1 },
        ErrorMsg = { fg = colors.red },
        WarningMsg = { fg = colors.yellow },
        MoreMsg = { fg = colors.purple, bold = 1 },
        Title = { fg = colors.purple, bold = 1 },
        Question = { fg = colors.purple, bold = 1 },
        NonText = { fg = colors.green, bold = 1 }, -- precedes, extend,...
        SpecialKey = { fg = colors.green, bold = 1 }, -- ... except Whitespace character
        Whitespace = { fg = colors.comment }, -- Trail, Tab,...
        NormalFloat = { fg = colors.fg },
        FloatBorder = { fg = colors.purple },
        FloatTitle = { fg = colors.green },
        FloatFooter = { fg = colors.green },
        Pmenu = { fg = colors.comment, bg = colors.bgdarker },
        PmenuKind = { fg = colors.comment, bg = colors.bgdarker },
        PmenuExtra = { fg = colors.comment, bg = colors.bgdarker },
        PmenuSel = { fg = colors.green, bg = colors.bgdarker },
        PmenuKindSel = { fg = colors.green, bg = colors.bgdarker },
        PmenuExtraSel = { fg = colors.green, bg = colors.bgdarker },
        PmenuMatchSel = { fg = colors.green, bg = colors.bgdarker },
        PmenuMatch = { fg = colors.purple, bg = colors.bgdarker },
        PmenuThumb = { bg = colors.purple },
        -- PmemuSbar = { bg = colors.selection }, -- Not Work
      }
    end,
  })
  vim.cmd.colorscheme("dracula")
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#44475A" })
  -- [[ Mini Nvim ]]====================================================
  add({ name = "mini.nvim" })
  -- [[ Extra ]]========================================================
  require("mini.extra").setup({})
  -- [[ AI ]]===========================================================
  local ai = require("mini.ai")
  local extras = require("mini.extra")
  ai.setup({
    n_lines = 500,
    search_method = "cover_or_next", -- One of 'cover', 'cover_or_next', 'cover_or_prev', 'cover_or_nearest', 'next', 'previous', 'nearest'
    custom_textobjects = {
      B = extras.gen_ai_spec.buffer(),
      D = extras.gen_ai_spec.diagnostic(),
      I = extras.gen_ai_spec.indent(),
      L = extras.gen_ai_spec.line(),
      N = extras.gen_ai_spec.number(),
      F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
      o = ai.gen_spec.treesitter({
        a = { "@block.outer", "@loop.outer", "@conditional.outer" },
        i = { "@block.inner", "@loop.inner", "@conditional.inner" },
      }),
    },
    mappings = {
      -- Main textobject prefixes
      around = "a",
      inside = "i",
      -- Next/last variants
      around_next = "an",
      inside_next = "in",
      around_last = "al",
      inside_last = "il",
      -- Move cursor to corresponding edge of `a` textobject
      goto_left = "g[",
      goto_right = "g]",
    },
  })
  -- [[ Align ]]========================================================
  require("mini.align").setup({
    steps = {
      pre_split = {},
      split = nil,
      pre_justify = {},
      justify = nil,
      pre_merge = {},
      merge = nil,
    },
    options = {
      split_pattern = "",
      justify_side = "left",
      merge_delimiter = "",
    },
    mappings = {
      start = "ga",
      start_with_preview = "gA",
    },
  })
  -- [[ Basics ]]========================================================
  require("mini.basics").setup({
    options = {
      basic = false, -- (Could cause slowly startup due to undofile)
      extra_ui = false,
      win_borders = nil,
    },
    mappings = {
      basic = true,
      windows = true,
      move_with_alt = true,
      option_toggle_prefix = [[\]], -- Prefix for mappings that toggle common options ('wrap', 'spell', ...)
    },
    autocommands = {
      basic = true,
      relnum_in_visual_mode = false,
    },
  })
  -- [[ Bracketed ]]====================================================
  require("mini.bracketed").setup({
    buffer = { suffix = "b", options = {} },
    comment = { suffix = "c", options = {} },
    conflict = { suffix = "x", options = {} },
    diagnostic = { suffix = "d", options = {} },
    file = { suffix = "f", options = {} },
    indent = { suffix = "i", options = {} },
    jump = { suffix = "j", options = {} },
    location = { suffix = "l", options = {} },
    oldfile = { suffix = "o", options = {} },
    quickfix = { suffix = "q", options = {} },
    treesitter = { suffix = "t", options = {} },
    undo = { suffix = "u", options = {} },
    window = { suffix = "w", options = {} },
    yank = { suffix = "y", options = {} },
  })
  -- [[ Bufremove ]]====================================================
  require("mini.bufremove").setup({
    set_vim_settings = true, -- Whether to set Vim's settings for buffers (allow hidden buffers)
  })
  -- [[ Clue ]]=========================================================
  local miniclue = require("mini.clue")
  miniclue.setup({
    clues = {
      { mode = "n", keys = "<Leader>B", desc = "  [B]uffer Fuzzy Finder" },
      { mode = "n", keys = "<Leader>b", desc = "  [b]uffer" },
      { mode = "n", keys = "<Leader>d", desc = "  [d]eps plugin manager" },
      { mode = "n", keys = "<Leader>F", desc = "󰔃  [F]iles Fuzzy Finder" },
      { mode = "n", keys = "<Leader>f", desc = "󰔃  [f]iles" },
      { mode = "n", keys = "<Leader>G", desc = "  [G]it Fuzzy Finder" },
      { mode = "n", keys = "<Leader>g", desc = "  [g]it             " },
      { mode = "n", keys = "<Leader>L", desc = "  [L]sp Fuzzy Finder" },
      { mode = "n", keys = "<Leader>l", desc = "  [l]sp" },
      { mode = "n", keys = "<Leader>m", desc = "  [m]ap" },
      { mode = "n", keys = "<Leader>V", desc = "  [V]isits Fuzzy Finder" },
      { mode = "n", keys = "<Leader>v", desc = "  [v]isits" },
      { mode = "n", keys = "<Leader>/", desc = "  Neovim Search" },
      { mode = "n", keys = "<Leader>?", desc = "  Neovim Help" },
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    triggers = {
      { mode = "n", keys = "<Leader>" }, -- Leader triggers
      { mode = "x", keys = "<Leader>" },
      { mode = "n", keys = [[\]] }, -- mini.basics
      { mode = "n", keys = "[" }, -- mini.bracketed
      { mode = "n", keys = "]" },
      { mode = "x", keys = "[" },
      { mode = "x", keys = "]" },
      { mode = "i", keys = "<C-x>" }, -- Built-in completion
      { mode = "n", keys = "g" }, -- `g` key
      { mode = "x", keys = "g" },
      { mode = "n", keys = "'" }, -- Marks
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },
      { mode = "n", keys = '"' }, -- Registers
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },
      { mode = "n", keys = "<C-w>" }, -- Window commands
      { mode = "n", keys = "z" }, -- `z` key
      { mode = "x", keys = "z" },
    },
    window = {
      config = {
        border = "double",
        anchor = "SW", -- NW:top-left, NE:top-right, SW:bottom-left, SE:bottom-right
        width = "auto",
        -- row = "auto",
        col = 0,
      },
      delay = 300,
      scroll_down = "<C-d>",
      scroll_up = "<C-u>",
    },
  })
  vim.api.nvim_set_hl(0, "MiniClueSeparator", { fg = "#bd93f9", bold = true })
  vim.api.nvim_set_hl(0, "MiniClueNextKey", { fg = "#50fa7b", bold = true })
  vim.api.nvim_set_hl(0, "MiniClueNextKeyWithPostkeys", { fg = "#ff5555" })
  vim.api.nvim_set_hl(0, "MiniClueDescSingle", { fg = "#f8f8f2" })
  vim.api.nvim_set_hl(0, "MiniClueDescGroup", { fg = "#8be9fd" })
  -- [[ Comment ]]======================================================
  require("mini.comment").setup({
    options = {
      custom_commentstring = nil, -- Function to compute custom 'commentstring' (optional)
      ignore_blank_line = false, -- Whether to ignore blank lines when commenting
      start_of_line = false, -- Whether to recognize as comment only lines without indent
      pad_comment_parts = true, -- Whether to force single space inner padding for comment parts
    },
    mappings = {
      -- Normal and Visual modes
      comment = "gc", -- Toggle comment (like `gcip` - comment inner paragraph) for both
      comment_line = "gcc", -- Toggle comment on current line
      comment_visual = "gc", -- Toggle comment on visual selection
      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      -- Works also in Visual mode if mapping differs from `comment_visual`
      textobject = "gc",
    },
    hooks = {
      pre = function() end, -- Before successful commenting. Does nothing by default.
      post = function() end, -- After successful commenting. Does nothing by default.
    },
  })
  -- [[ Cursorword ]]===================================================
  require("mini.cursorword").setup({
    delay = 100,
  })
  -- [[ Files ]]========================================================
  require("mini.files").setup({
    content = {
      filter = nil, -- Predicate for which file system entries to show
      prefix = nil, -- What prefix to show to the left of file system entry
      sort = nil, -- In which order to show file system entries
    },
    options = {
      permanent_delete = true, -- Whether to delete permanently or move into module-specific trash
      use_as_default_explorer = true, -- Whether to use for editing directories
    },
    windows = {
      max_number = math.huge, -- Maximum number of windows to show side by side
      preview = true,
      width_focus = 25,
      width_nofocus = 25,
      width_preview = 50,
    },
    -- mappings = {
    --   close = 'q',
    --   go_in = 'l',
    --   go_in_plus = 'L',
    --   go_out = 'h',
    --   go_out_plus = 'H',
    --   reset = '<BS>',
    --   reveal_cwd = '@',
    --   show_help = 'g?',
    --   synchronize = '=',
    --   trim_left = '<',
    --   trim_right = '>',
    -- },
  })
  local minifiles_augroup = vim.api.nvim_create_augroup("mini-files", {})
  vim.api.nvim_create_autocmd("User", {
    group = minifiles_augroup,
    pattern = "MiniFilesWindowOpen",
    callback = function(args)
      vim.api.nvim_win_set_config(args.data.win_id, { border = "double" })
    end,
  })
  vim.api.nvim_set_hl(0, "MiniFilesNormal", { fg = "#f8f8f2" })
  vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { bg = "#44475a" })
  vim.api.nvim_set_hl(0, "MiniFilesBorder", { fg = "#bd93f9" })
  vim.api.nvim_set_hl(0, "MiniFilesBorderModified", { fg = "#ffb86c" })
  vim.api.nvim_set_hl(0, "MiniFilesFile", { fg = "#f8f8f2" })
  vim.api.nvim_set_hl(0, "MiniFilesDirectory", { fg = "#8be9fd" })
  vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = "#bd93f9" })
  vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { fg = "#50fa7b", bold = true })
  -- [[ Git ]]==========================================================
  require("mini.git").setup({
    -- General CLI execution
    job = {
      git_executable = "git", -- Path to Git executable
      timeout = 30000, -- Timeout (in ms) for each job before force quit
    },
    -- Options for `:Git` command
    command = {
      split = "auto", -- Default split direction
    },
  })
  local align_blame = function(au_data)
    if au_data.data.git_subcommand ~= "blame" then
      return
    end
    -- Align blame output with source
    local win_src = au_data.data.win_source
    vim.wo.wrap = false
    vim.fn.winrestview({ topline = vim.fn.line("w0", win_src) })
    vim.api.nvim_win_set_cursor(0, { vim.fn.line(".", win_src), 0 })
    -- Bind both windows so that they scroll together
    vim.wo[win_src].scrollbind, vim.wo.scrollbind = true, true
  end
  local group = vim.api.nvim_create_augroup("minigit", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "MiniGitCommandSplit",
    callback = align_blame,
  })
  vim.api.nvim_create_autocmd({ "FileType" }, {
    group = group,
    pattern = { "git", "diff" },
    desc = "Set fold configuration for mini.git",
    callback = function()
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "v:lua.MiniGit.diff_foldexpr()"
    end,
  })
  -- [[ Icons ]]========================================================
  require("mini.icons").setup({
    style = "glype",
  })
  MiniIcons.mock_nvim_web_devicons()
  -- [[ Indentscope ]]==================================================
  require("mini.indentscope").setup({
    symbol = "│",
    draw = {
      delay = 20,
      -- No animation
      animation = function()
        return 0
      end,
      priority = 2,
    },
    options = {
      -- Type of scope's border: which line(s) with smaller indent to categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
      border = "both",
      -- Whether to use cursor column when computing reference indent.
      -- Useful to see incremental scopes with horizontal cursor movements.
      indent_at_cursor = true,
      -- Whether to first check input line to be a border of adjacent scope.
      -- Use it if you want to place cursor on function header to get scope of its body.
      try_as_border = true,
    },
    mappings = {
      -- Textobjects
      object_scope = "ii",
      object_scope_with_border = "ai",
      -- Motions (jump to respective border line; if not present - body line)
      goto_top = "[i",
      goto_bottom = "]i",
    },
  })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "dashboard",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#50fa7b", bold = true })
  vim.api.nvim_set_hl(0, "MiniIndentscopeSymbolOff", { fg = "#50fa7b", bold = true })
  -- [[ Jump ]]=========================================================
  require("mini.jump").setup({
    -- Set any of them to a very big number (like 10^7) to virtually disable.
    delay = {
      highlight = 250, -- Delay between jump and highlighting all possible jumps
      idle_stop = 10000000, -- Delay between jump and automatic stop if idle (no jump is done)
    },
    mappings = {
      forward = "f",
      backward = "F",
      forward_till = "t",
      backward_till = "T",
      repeat_jump = ";",
    },
  })
  -- [[ Jump2d ]]=======================================================
  require("mini.jump2d").setup({
    -- For more information see |MiniJump2d.start|.
    -- If `nil` (default) - use |MiniJump2d.default_spotter|
    spotter = nil,
    labels = "abcdefghijklmnopqrstuvwxyz", -- Characters used for labels of jump spots (in supplied order)
    view = {
      dim = true, -- Whether to dim lines with at least one jump spot
      n_steps_ahead = 2, -- How many steps ahead to show. Set to big number to show all steps.
    },
    -- Which lines are used for computing spots
    allowed_lines = {
      blank = true, -- Blank line (not sent to spotter even if `true`)
      cursor_before = true, -- Lines before cursor line
      cursor_at = true, -- Cursor line
      cursor_after = true, -- Lines after cursor line
      fold = true, -- Start of fold (not sent to spotter even if `true`)
    },
    -- Which windows from current tabpage are used for visible lines
    allowed_windows = {
      current = true,
      not_current = true,
    },
    -- Functions to be executed at certain events
    hooks = {
      before_start = nil, -- Before jump start
      after_jump = nil, -- After jump was actually done
    },
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      start_jumping = "<CR>",
    },
  })
  vim.api.nvim_set_hl(0, "MiniJump2dSpot", { fg = "#ffb86c", bg = "#191a21", bold = true, nocombine = true })
  vim.api.nvim_set_hl(0, "MiniJump2dSpotAhead", { fg = "#8be9fd", bg = "#191a21", bold = false, nocombine = true })
  -- [[ Map ]]==========================================================
  local map = require("mini.map")
  map.setup({
    symbols = {
      encode = map.gen_encode_symbols.dot("4x2"), -- Or block("3x2")
      scroll_line = "█",
      scroll_view = "┃",
    },
    integrations = {
      map.gen_integration.builtin_search(),
      map.gen_integration.diff(),
      map.gen_integration.diagnostic({
        error = "DiagnosticFloatingError",
        warn = "DiagnosticFloatingWarn",
        info = "DiagnosticFloatingInfo",
        hint = "DiagnosticFloatingHint",
      }),
    },
    window = {
      focusable = false, -- Whether window is focusable in normal way (with `wincmd` or mouse)
      side = "right", -- Side to stick ('left' or 'right')
      show_integration_count = true, -- Whether to show count of multiple integration highlights
      width = 20,
      winblend = 0,
      zindex = 10, -- Z-index
    },
  })
  for _, key in ipairs({ "n", "N", "*" }) do
    vim.keymap.set("n", key, key .. "zv<Cmd>lua MiniMap.refresh({}, { lines = false, scrollbar = false })<CR>")
  end
  vim.api.nvim_set_hl(0, "MiniMapNormal", { fg = "#f8f8f2", bg = "#191a21" })
  vim.api.nvim_set_hl(0, "MiniMapSymbolCount", { fg = "#50fa7b" })
  vim.api.nvim_set_hl(0, "MiniMapSymbolLine", { fg = "#bd93f9" })
  vim.api.nvim_set_hl(0, "MiniMapSymbolView", { fg = "#44475a" })
  -- [[ Misc ]]=========================================================
  require("mini.misc").setup({ make_global = { "put", "put_text", "stat_summary", "bench_time" } })
  MiniMisc.setup_auto_root({})
  MiniMisc.setup_restore_cursor({})
  -- [[ Move ]]=========================================================
  require("mini.move").setup({
    reindent_linewise = true,
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = "<M-h>",
      right = "<M-l>",
      down = "<M-j>",
      up = "<M-k>",
      -- Move current line in Normal mode
      line_left = "<M-h>",
      line_right = "<M-l>",
      line_down = "<M-j>",
      line_up = "<M-k>",
    },
  })
  -- [[ Notify ]]=======================================================
  local filterout_lua_diagnosing = function(notif_arr)
    local not_diagnosing = function(notif)
      return not vim.startswith(notif.msg, "lua_ls: Diagnosing")
    end
    notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
    return MiniNotify.default_sort(notif_arr)
  end
  require("mini.notify").setup({
    content = {
      format = nil, -- Function which formats the notification message
      sort = filterout_lua_diagnosing, -- Function which orders notification array from most to least important
    },
    lsp_progress = {
      enable = true,
      duration_last = 1000, -- Duration (in ms) of how long last message should be shown
    },
    window = {
      config = {
        border = "double",
      }, -- Floating window config
      max_width_share = 0.382, -- Maximum window width as share (between 0 and 1) of available columns
      winblend = 0,
    },
  })
  vim.notify = MiniNotify.make_notify({
    ERROR = { duration = 5000, hl_group = "DiagnosticError" },
    WARN = { duration = 5000, hl_group = "DiagnosticWarn" },
    INFO = { duration = 5000, hl_group = "DiagnosticInfo" },
    DEBUG = { duration = 0, hl_group = "DiagnosticHint" },
    TRACE = { duration = 0, hl_group = "DiagnosticOk" },
    OFF = { duration = 0, hl_group = "MiniNotifyNormal" },
  })
  -- [[ Operators ]]====================================================
  require("mini.operators").setup({
    -- Evaluate text and replace with output
    evaluate = {
      prefix = "g=",
      func = nil, -- Function which does the evaluation
    },
    -- Exchange text regions
    exchange = {
      prefix = "gx",
      reindent_linewise = true, -- Whether to reindent new text to match previous indent
    },
    -- Multiply (duplicate) text
    multiply = {
      prefix = "gm",
      func = nil, -- Function which can modify text before multiplying
    },
    -- Replace text with register
    replace = {
      prefix = "gr",
      reindent_linewise = true, -- Whether to reindent new text to match previous indent
    },
    -- Sort text
    sort = {
      prefix = "gs",
      func = nil, -- Function which does the sort
    },
  })
  -- [[ Pairs ]]========================================================
  require("mini.pairs").setup({
    modes = { insert = true, command = true, terminal = true },
    mappings = {
      ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
      ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
      ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
      [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
      ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
      ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
      ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
      ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
      ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
    },
  })
  -- [[ Pick ]]=========================================================
  local win_config = function()
    -- Center
    -- Size
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
      anchor = "NW",
      height = height,
      width = width,
      border = "double",
      -- Position
      row = math.floor(0.3 * (vim.o.lines - height)),
      col = math.floor(0.475 * (vim.o.columns - width)),
    }
  end
  local win_config_1 = function()
    -- Bottom-Left
    -- Size
    local height = math.floor(0.5 * vim.o.lines)
    local width = math.floor(0.4865 * vim.o.columns)
    return {
      anchor = "SW",
      height = height,
      width = width,
      border = "double",
      -- Position
      -- row = math.floor(0.3 * (vim.o.lines - height)),
      col = 0,
    }
  end
  require("mini.pick").setup({
    delay = {
      async = 10, -- Delay between forcing asynchronous behavior
      busy = 50, -- Delay between computation start and visual feedback about it
    },
    source = {
      items = nil,
      name = nil,
      cwd = nil,
      match = nil,
      show = nil,
      preview = nil,
      choose = nil,
      choose_marked = nil,
    },
    options = {
      use_cache = true, -- Whether to cache matches (more speed and memory on repeated prompts)
      content_from_bottom = false, -- Whether to show content from bottom to top
    },
    window = {
      config = win_config_1,
      prompt_cursor = "▓",
      prompt_prefix = "❱ ",
    },
    mappings = {
      caret_left = "<Left>",
      caret_right = "<Right>",
      choose = "<CR>",
      choose_in_split = "<C-s>",
      choose_in_tabpage = "<C-t>",
      choose_in_vsplit = "<C-v>",
      choose_marked = "<M-CR>",
      delete_char = "<BS>",
      delete_char_right = "<Del>",
      delete_left = "<C-u>",
      delete_word = "<C-w>",
      mark = "<C-x>",
      mark_all = "<C-a>",
      move_down = "<C-n>",
      move_start = "<C-g>",
      move_up = "<C-p>",
      paste = "<C-r>",
      refine = "<C-Space>",
      refine_marked = "<M-Space>",
      scroll_down = "<C-f>",
      scroll_left = "<C-h>",
      scroll_right = "<C-l>",
      scroll_up = "<C-b>",
      stop = "<Esc>",
      toggle_info = "<S-Tab>",
      toggle_preview = "<Tab>",
    },
  })
  vim.ui.select = MiniPick.ui_select
  -- Adding custom picker to pick `register` entries
  MiniPick.registry.registry = function()
    local items = vim.tbl_keys(MiniPick.registry)
    table.sort(items)
    local source = { items = items, name = "Registry", choose = function() end }
    local chosen_picker_name = MiniPick.start({ source = source })
    if chosen_picker_name == nil then
      return
    end
    return MiniPick.registry[chosen_picker_name]()
  end
  -- Make `:Pick files` accept `cwd`
  MiniPick.registry.files = function(local_opts)
    local opts = { source = { cwd = local_opts.cwd } }
    local_opts.cwd = nil
    return MiniPick.builtin.files(local_opts, opts)
  end
  -- vim.api.nvim_set_hl(0, "")
  -- [[ Sessions ]]=====================================================
  require("mini.sessions").setup({
    autowrite = true,
    autoread = false,
    force = { read = false, write = true, delete = false }, -- Whether to force possibly harmful actions (meaning depends on function)
    verbose = { read = false, write = true, delete = true }, -- Whether to print session path after action
    hooks = {
      pre = { read = nil, write = nil, delete = nil }, -- Before successful action
      post = { read = nil, write = nil, delete = nil }, -- After successful action
    },
  })
  -- [[ Splitjoin ]]====================================================
  require("mini.splitjoin").setup({
    detect = {
      -- Array of Lua patterns to detect region with arguments.
      -- Default: { '%b()', '%b[]', '%b{}' }
      brackets = nil,
      -- String Lua pattern defining argument separator
      separator = ",",
      -- Array of Lua patterns for sub-regions to exclude separators from.
      -- Enables correct detection in presence of nested brackets and quotes.
      -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
      exclude_regions = nil,
    },
    -- Split options
    split = {
      hooks_pre = {},
      hooks_post = {},
    },
    -- Join options
    join = {
      hooks_pre = {},
      hooks_post = {},
    },
    mappings = {
      toggle = "gS",
      split = "",
      join = "",
    },
  })
  -- [[ Starter ]]======================================================
  require("mini.starter").setup({
    autoopen = true,
    items = {
      require("mini.starter").sections.builtin_actions(),
      -- require("mini.starter").sections.sessions(5, true),
      require("mini.starter").sections.recent_files(5, false, true),
    },
    header = [[
          ████ ██████           █████  ██ ██
         ███████████             █████ ███
         █████████ ███████████████████ ███ ██████████
        █████████  ███    █████████████ ████ ████████████
       █████████ ██████████ █████████ ████ ████ ████ ████
     ███████████ ███    ███ █████████ ████ ████ ████ ████
    ██████  █████████████████████ ████ ████ ████ ████ █████
    ]],
    footer = [[]],
    query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.", -- Characters to update query
  })
  vim.api.nvim_set_hl(0, "MiniStarterCurrent", { fg = "#bd93f9" })
  -- vim.api.nvim_set_hl(0, 'MiniStarterHeader', { fg = '#bd93f9' })
  -- vim.api.nvim_set_hl(0, 'MiniStarterFooter', { fg = '#bd93f9' })
  -- vim.api.nvim_set_hl(0, 'MiniStarterInactive', { fg = '#f8f8f2' })
  vim.api.nvim_set_hl(0, "MiniStarterItem", { fg = "#6272A4" })
  vim.api.nvim_set_hl(0, "MiniStarterItemBullet", { fg = "#bd93f9" })
  vim.api.nvim_set_hl(0, "MiniStarterItemPrefix", { fg = "#50fa7b" })
  -- vim.api.nvim_set_hl(0, 'MiniStarterSession', { fg = '#bd93f9' })
  vim.api.nvim_set_hl(0, "MiniStarterQuery", { fg = "#50fa7b" })
  -- [[ Surround ]]=====================================================
  require("mini.surround").setup({
    custom_surroundings = nil,
    highlight_duration = 500,
    -- Number of lines within which surrounding is searched
    n_lines = 20,
    -- Whether to respect selection type:
    -- - Place surroundings on separate lines in linewise mode.
    -- - Place surroundings on each line in blockwise mode.
    respect_selection_type = false,
    -- How to search for surrounding (first inside current line, then inside neighborhood)
    -- One of 'cover', 'cover_or_next', 'cover_or_prev', 'cover_or_nearest', 'next', 'prev', 'nearest'
    search_method = "cover",
    mappings = {
      add = "sa", -- Add surrounding in Normal and Visual modes
      delete = "sd", -- Delete surrounding
      find = "sf", -- Find surrounding (to the right)
      find_left = "sF", -- Find surrounding (to the left)
      highlight = "sh", -- Highlight surrounding
      replace = "sr", -- Replace surrounding
      update_n_lines = "sn", -- Update `n_lines`
      suffix_last = "l", -- Suffix to search with "prev" method
      suffix_next = "n", -- Suffix to search with "next" method
    },
  })
  vim.keymap.set({ "n", "x" }, "s", "<Nop>")
  -- [[ Trailspace ]]===================================================
  require("mini.trailspace").setup({
    -- Highlight only in normal buffers (ones with empty 'buftype')
    -- Useful to not show trailing whitespace where it usually doesn't matter
    only_in_normal_buffers = true,
  })
  -- [[ Visits ]]=======================================================
  require("mini.visits").setup({
    -- How visit index is converted to list of paths
    list = {
      filter = nil, -- Predicate for which paths to include (all by default)
      sort = nil, -- Sort paths based on the visit data (robust frecency by default)
    },
    -- How visit index is stored
    store = {
      autowrite = true, -- Whether to write all visits before Neovim is closed
      normalize = nil, -- Function to ensure that written index is relevant
      path = vim.fn.stdpath("data") .. "/mini-visits-index", -- Path to store visit index
    },
    -- How visit tracking is done
    track = {
      event = "BufEnter", -- Start visit register timer at this event
      delay = 1000, -- Debounce delay after event to register a visit
    },
  })
  local map_pick_core = function(keys, cwd, desc)
    local rhs = function()
      local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
      MiniExtra.pickers.visit_paths({ cwd = cwd, filter = "core", sort = sort_latest }, { source = { name = desc } })
    end
    local opts = opts or {}
    opts.desc = desc
    vim.keymap.set("n", "<Leader>" .. keys, rhs, opts)
  end
  map_pick_core("vc", "", "Core visits (all)")
  map_pick_core("vC", nil, "Core visits (cwd)")
end)
now(function() -- Plugins
  add("dstein64/vim-startuptime")
  -- [[ Lualine Nvim]]==================================================
  add({
    source = "nvim-lualine/lualine.nvim",
    -- depends = {"nvim-tree/nvim-web-devicons"}
  })
  local colors = {
    orange = "#ffb86c",
    purple = "#bd93f9",
    green = "#50fa7b",
    black = "#282a36",
    pink = "ff79c6",
    cyan = "8be9fd",
  }
  local custom_dracula = {
    normal = {
      a = { bg = colors.purple, fg = colors.black, gui = "bold" },
    },
    insert = {
      a = { bg = colors.green, fg = colors.black, gui = "bold" },
    },
    visual = {
      a = { bg = colors.orange, fg = colors.black, gui = "bold" },
    },
    replace = {
      a = { bg = colors.pink, fg = colors.black, gui = "bold" },
    },
    command = {
      a = { bg = colors.purple, fg = colors.black, gui = "bold" },
    },
    inactive = {
      a = { bg = colors.black, fg = colors.black, gui = "bold" },
    },
  }
  local function custom_1()
    return [[ ]]
  end
  local function custom_2()
    return [[%4c┃%-4l ]]
  end
  local function custom_3()
    return [[ ]]
  end
  local function custom_4()
    return [[]]
  end
  local lint_progress = function()
    local linters = require("lint").get_running()
    if #linters == 0 then
      return "󰦕 "
    end
    return "󱉶 " .. table.concat(linters, ", ")
  end
  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = custom_dracula,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = false,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        { custom_1, padding = 0 },
        { "encoding", padding = 0 },
        { "fileformat", padding = 1 },
        { custom_2, padding = 0 },
        { "filetype", colored = false, icon_only = true, padding = 0 },
        { "filename", newfile_status = true, path = 0, padding = 0 },
        { custom_3, padding = 0 },
        {
          "diagnostics",
          colored = false,
          sections = { "error", "warn", "info", "hint" },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          padding = 0,
        },
        { "%=" },
        -- { lint_progress, padding = 0 },
        { "searchcount", maxcount = 9999, timeout = 1000, padding = 0 },
        { custom_4, padding = 0 },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
  -- [[ Treesitter Nvim ]]==============================================
  add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "master",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })
  add("nvim-treesitter/nvim-treesitter-textobjects")
  require("nvim-treesitter.install").prefer_git = true
  require("nvim-treesitter.configs").setup({
    modules = { "textobjects" },
    auto_install = true,
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    ignore_install = {},
    ensure_installed = {
      "asm",
      "awk",
      "bash",
      "c",
      "cmake",
      "comment",
      "css",
      "csv",
      "disassembly",
      "dockerfile",
      "fish",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "html",
      "http",
      "javascript",
      "json",
      "json5",
      "lua",
      "luadoc",
      "make",
      "nix",
      "passwd",
      "pem",
      "perl",
      "python",
      "regex",
      "sql",
      "ssh_config",
      "tmux",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "ruby" },
    },
    indent = {
      enable = true,
      disable = { "ruby" },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj
      },
    },
  })
  -- Disable injections in 'lua' language. In Neovim<0.9 it is
  -- local ts_query = require('vim.treesitter.query')
  -- local ts_query_set = ts_query.set or ts_query.set_query
  -- ts_query_set('lua', 'injections', '')
  -- Autocommand for setting foldmethod when treesitter enable
  vim.api.nvim_create_autocmd("FileType", {
    pattern = advanced_filetype,
    callback = function()
      vim.opt_local.foldmethod = "expr"
      vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Foldmethod expr may cause lag at startup
    end,
  })
  -- [[ Inline Diagnostic Nvim ]]=======================================
  add("rachartier/tiny-inline-diagnostic.nvim")
  vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,
    underline = false,
    float = {
      border = "double",
      source = true,
    },
    virtual_text = false,
    signs = {
      linehl = {},
      numhl = {},
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = " ",
      },
    },
  })
  require("tiny-inline-diagnostic").setup({
    signs = {
      left = "",
      right = "",
      diag = "●",
      arrow = "  ",
      up_arrow = "  ",
      vertical = "│",
      vertical_end = "╰",
    },
    hi = {
      error = "DiagnosticError",
      warn = "DiagnosticWarn",
      info = "DiagnosticInfo",
      hint = "DiagnosticHint",
      -- arrow = "SpecialKey",
      background = "normal", -- Can be a highlight or a hexadecimal color (#RRGGBB)
      -- mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
    },
    blend = {
      factor = 0.27,
    },
    options = {
      throttle = 20,
      softwrap = 15,
      multiple_diag_under_cursor = false,
      overflow = {
        mode = "wrap",
      },
      break_line = {
        enabled = false,
        after = 30,
      },
      virt_texts = {
        priority = 2048,
      },
    },
  })
  -- [[ Completion Nvim]]===============================================
  add({
    source = "hrsh7th/nvim-cmp",
    depends = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
    },
  })
  local cmp = require("cmp")
  local winopts = {
    border = "double",
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
  }
  local kind_icons = {
    Array = " ",
    Boolean = "󰨙 ",
    Class = " ",
    Codeium = " ", -- "󰘦 ",
    Color = " ",
    Control = " ",
    Collapsed = " ",
    Constant = "󰏿 ",
    Constructor = " ",
    Copilot = " ",
    Enum = " ",
    EnumMember = " ",
    Event = " ",
    Field = " ",
    File = " ",
    Folder = " ",
    Function = "󰊕 ",
    Interface = " ",
    Key = " ",
    Keyword = " ",
    Method = "󰊕 ",
    Module = " ",
    Namespace = "󰦮 ",
    Null = " ",
    Number = "󰎠 ",
    Object = " ",
    Operator = " ",
    Package = " ",
    Property = " ",
    Reference = " ",
    Snippet = " ",
    String = " ",
    Struct = "󰆼 ",
    TabNine = "󰏚 ",
    Text = " ",
    TypeParameter = " ",
    Unit = " ",
    Value = " ",
    Variable = "󰀫 ",
  }
  local kind_icons_1 = {
    Text = " ",
    Method = "󰆧 ",
    Function = "󰊕 ",
    Constructor = " ",
    Field = "󰇽 ",
    Variable = "󰂡 ",
    Class = "󰠱 ",
    Interface = " ",
    Module = " ",
    Property = "󰜢 ",
    Unit = " ",
    Value = "󰎠 ",
    Enum = " ",
    Keyword = "󰌋 ",
    Snippet = " ",
    Color = "󰏘 ",
    File = "󰈙 ",
    Reference = " ",
    Folder = "󰉋 ",
    EnumMember = " ",
    Constant = "󰏿 ",
    Struct = " ",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  }
  local kind_icons_2 = {
    Text = "  ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",
    Field = "  ",
    Variable = "  ",
    Class = "  ",
    Interface = "  ",
    Module = "  ",
    Property = "  ",
    Unit = "  ",
    Value = "  ",
    Enum = "  ",
    Keyword = "  ",
    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    EnumMember = "  ",
    Constant = "  ",
    Struct = "  ",
    Event = "  ",
    Operator = "  ",
    TypeParameter = "  ",
  }
  cmp.setup({
    formatting = {
      expandable_indicator = true,
      fields = { "abbr", "kind", "menu" },
      format = function(_, vim_item)
        vim_item.kind = (kind_icons[vim_item.kind] or "") .. vim_item.kind
        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(winopts),
      documentation = cmp.config.window.bordered(winopts),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<S-CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
      ["<C-Space>"] = cmp.mapping.complete({}),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if vim.snippet.active({ direction = 1 }) then
          vim.snippet.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if vim.snippet.active({ direction = -1 }) then
          vim.snippet.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "path" },
    }, {
      { name = "buffer" },
    }),
  })
  -- `/` cmdline setup.
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
  -- `:` cmdline setup.
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man" },
        },
      },
    }),
  })
  vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#6272a4" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrDefault", { fg = "#6272a4" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#50fa7b" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchDefault", { fg = "#50fa7b" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#50fa7b" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzyDefault", { fg = "#50fa7b" })
  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#6272a4", strikethrough = true })
  vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecatedDefault", { fg = "#6272a4", strikethrough = true })
  -- [[ LSP config ]]===================================================
  add({
    source = "williamboman/mason-lspconfig.nvim",
    depends = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "neovim/nvim-lspconfig",
      "folke/lazydev.nvim",
    },
  })
  local servers = {
    -- bashls = {},
    -- fish_lsp = {},
    -- awk_ls = {},
    lua_ls = {
      -- on_init = function(client)
      --   local path = client.workspace_folders[1].name
      --   if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      --     return
      --   end
      --   client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      --     runtime = {
      --       version = "LuaJIT",
      --     },
      --     workspace = {
      --       checkThirdParty = false,
      --       library = {
      --         vim.env.VIMRUNTIME,
      --         -- "${3rd}/luv/library"
      --         -- "${3rd}/busted/library",
      --       },
      --     },
      --   })
      -- end,
      settings = {
        Lua = {
          hint = {
            enable = true,
          },
          completion = {
            callSnippet = "Replace",
          },
          -- diagnostics = { disable = { "undefined-global" } },
        },
      },
    },
    -- perlnavigator = {},
    -- pyright = {},
    -- asm_lsp = {},
    -- clangd = {},
    -- autotools_ls = {},
    -- nil_ls = {
    --   autostart = true,
    --   settings = {
    --     ["nil"] = {
    --       testSetting = 42,
    --       formatting = {
    --         command = { "nixpkgs-fmt" },
    --       },
    --     },
    --   },
    -- },
    dockerls = {
      settings = {
        docker = {
          languageserver = {
            formatter = {
              ignoreMultilineInstructions = true,
            },
          },
        },
      },
    },
    -- docker_compose_language_service = {}, -- "set filetype=yaml.docker-compose" if not run
    -- gopls = {
    --   hints = {
    --     assignVariableTypes = true,
    --     compositeLiteralFields = true,
    --     compositeLiteralTypes = true,
    --     constantValues = true,
    --     functionTypeParameters = false,
    --     parameterNames = false,
    --     rangeVariableTypes = true,
    --   },
    -- },
    -- html = {},
    -- cssls = {},
    -- eslint = {
    --   on_attach = function(client, bufnr)
    --     vim.api.nvim_create_autocmd("BufWritePre", {
    --       buffer = bufnr,
    --       command = "EslintFixAll",
    --     })
    --   end,
    -- },
    -- sqls = {
    --   -- cmd = {"path/to/command", "-config", "path/to/config.yml"};
    -- },
    -- jsonls = {},
    -- lemminx = {},
    -- yamlls = {
    --   settings = {
    --     yaml = {
    --       -- ... other settings. note this overrides the lspconfig defaults.
    --       schemas = {
    --         ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
    --         ["../path/relative/to/file.yml"] = "/.github/workflows/*",
    --         ["/path/from/root/of/project"] = "/.github/workflows/*",
    --       },
    --     },
    --   },
    -- },
  }
  local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" }),
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
  capabilities = vim.tbl_deep_extend("force", capabilities, {
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true,
      },
    },
  })
  require("lazydev").setup({})
  require("mason").setup({
    ui = {
      check_outdated_packages_on_open = true,
      border = "double",
      width = 0.8, -- Float in the range of 0-1 for a percentage of screen width
      height = 0.9, -- Float in the range of 0-1 for a percentage of screen width
      icons = {
        package_installed = "✔",
        package_pending = "●",
        package_uninstalled = "✘",
      },
    },
  })
  require("mason-tool-installer").setup({
    ensure_installed = {
      -- [[ LSP Server ]]-----------------------------------------------
      "bash-language-server",
      -- "awk-language-server",
      "lua-language-server",
      "perlnavigator",
      -- "pyright",
      -- "asm-lsp",
      -- "clangd",
      "autotools-language-server",
      -- "nil",
      "dockerfile-language-server",
      "docker-compose-language-service",
      -- "gopls",
      -- "html-lsp",
      -- "css-lsp",
      -- "eslint-lsp",
      -- "sqls",
      -- "json-lsp",
      -- "lemminx",
      -- "yaml-language-server",
      -- [[ Formatter  ]]-----------------------------------------------
      "shellcheck",
      "stylua",
      "isort",
      "black",
      "asmfmt",
      "clang-format",
      "nixpkgs-fmt",
      "goimports",
      "prettierd",
      "prettier",
      -- [[ Linter     ]]-----------------------------------------------
      -- "luacheck",
      -- "checkmake",
      -- "cmakelint",
      -- "hadolint",
      -- "jsonlint",
      -- "yamllint",
      -- Debugger
    },
    auto_update = false,
    run_on_start = true,
    start_delay = 0,
    debounce_hours = nil,
    integrations = {
      ["mason-lspconfig"] = true,
      ["mason-null-ls"] = true,
      ["mason-nvim-dap"] = true,
    },
  })
  require("mason-lspconfig").setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.handlers = vim.tbl_deep_extend("force", {}, handlers, server.handlers or {})
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        require("lspconfig")[server_name].setup(server)
        -- require("lspconfig")[server_name].setup({})
      end,
    },
  })
  -- [[ Conform Nvim]]==================================================
  add("stevearc/conform.nvim")
  require("conform").setup({
    notify_on_error = true,
    format_on_save = function(bufnr)
      local ignore_filetypes = { "sql" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    formatters_by_ft = {
      sh = { "shellcheck" },
      fish = { "fish_indent" },
      awk = { "awk" },
      lua = { "stylua" },
      -- perl = { 'perlimports', 'perltidy' }, -- Not work!!!
      python = { "isort", "black" }, -- Use a sub-list to run only the first available formatter
      asm = { "asmfmt" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      nix = { "nixpkgs-fmt" },
      go = { "goimports", "gofmt" }, -- Conform will run multiple formatters sequentially
      html = { { "prettierd", "prettier" } },
      css = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      markdown = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      yaml = { { "prettierd", "prettier" } },
    },
  })
  require("conform").formatters.stylua = {
    prepend_args = {
      "--column-width",
      "120",
      "--line-endings",
      "Unix",
      "--indent-type",
      "Spaces", -- "Tabs"
      "--indent-width",
      "2",
      "--quote-style",
      "AutoPreferDouble",
      "--call-parentheses",
      "Always",
      "--collapse-simple-statement",
      "Never",
    },
  }
  vim.api.nvim_create_autocmd("FileType", {
    pattern = advanced_filetype,
    callback = function()
      vim.opt_local.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
  })
  -- [[ Lint Nvim ]]====================================================
  add("mfussenegger/nvim-lint")
  require("lint").linters_by_ft = {
    -- sh = { "shellcheck" },
    -- fish = { "fish" },
    -- lua = { "luacheck" },
    -- perl = { 'perlcritic' }, -- Not work!!!
    -- c = { "clangtidy" },
    -- cpp = { "clangtidy" },
    -- make = { "checkmake" },
    -- cmake = { "cmakelint" },
    -- nix = { "nix" },
    -- dockerfile = { "hadolint" },
    -- json = { "jsonlint" },
    -- yaml = { "yamllint" },
    -- markdown = { "vale" },
    -- text = { "vale" },
  }
  local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = lint_augroup,
    callback = function()
      require("lint").try_lint()
    end,
  })
end)
later(function() -- [Not Use]
  -- -- [[ Animate ]]==[Cause high startup + Ram overflow with big file]===
  -- local is_many_wins = function(sizes_from, sizes_to)
  --   return vim.tbl_count(sizes_from) >= 3
  -- end
  -- local is_not_single_window = function(win_id)
  --   local tabpage_id = vim.api.nvim_win_get_tabpage(win_id)
  --   return #vim.api.nvim_tabpage_list_wins(tabpage_id) > 1
  -- end
  -- local animate = require("mini.animate")
  -- animate.setup({
  --   cursor = {
  --     enable = false,
  --     -- Animate with linear easing
  --     timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
  --     -- Animate for any cursor move
  --     path = animate.gen_path.angle({
  --       predicate = function()
  --         return true
  --       end,
  --     }),
  --   },
  --   scroll = {
  --     enable = false,
  --     -- Animate with linear easing
  --     timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
  --     -- Animate equally but with at most 120 steps instead of default 60
  --     subscroll = animate.gen_subscroll.equal({ max_output_steps = 120 }),
  --   },
  --   resize = {
  --     enable = true,
  --     -- Animate with linear easing
  --     timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
  --     -- Animate only if there are at least 3 windows
  --     subresize = animate.gen_subresize.equal({ predicate = is_many_wins }),
  --   },
  --   open = {
  --     enable = true,
  --     -- Animate for 400 milliseconds with linear easing
  --     timing = animate.gen_timing.linear({ duration = 400, unit = "total" }),
  --     -- Animate with center|static|wiping from nearest edge instead of default static one
  --     winconfig = animate.gen_winconfig.static({
  --       predicate = is_not_single_window,
  --       -- direction = "from_center", -- For center
  --       n_steps = 50,
  --     }),
  --     -- Make bigger windows more transparent
  --     winblend = animate.gen_winblend.linear({ from = 80, to = 100 }),
  --   },
  --   close = {
  --     enable = true,
  --     -- Animate for 400 milliseconds with linear easing
  --     timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
  --     -- Animate with wiping to nearest edge instead of default static one
  --     winconfig = animate.gen_winconfig.center({
  --       predicate = is_not_single_window,
  --       direction = "to_center",
  --     }),
  --     -- Make bigger windows more transparent
  --     winblend = animate.gen_winblend.linear({ from = 100, to = 80 }),
  --   },
  -- })
  -- -- [[ Completion ]]===================================================
  -- require("mini.completion").setup({
  --   set_vim_settings = false,
  --   delay = { completion = 100, info = 100, signature = 50 }, -- Disable by setting very high delay time (like 10^7)
  --   lsp_completion = {
  --     source_func = "omnifunc",
  --     auto_setup = true,
  --   },
  --   mappings = {
  --     force_twostep = "<C-Space>", -- Force two-step completion
  --     force_fallback = "<A-Space>", -- Force fallback completion
  --     go_in = "<RET>",
  --   },
  --   window = {
  --     info = { height = 25, width = 80, border = "double" },
  --     signature = { height = 25, width = 80, border = "double" },
  --   },
  -- })
  -- -- [[ Diff ]]=========================================================
  -- require('mini.diff').setup {
  --   source = nil,
  --   delay = {
  --     text_change = 200,
  --   },
  --   view = {
  --     style = 'sign', -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
  --     signs = { add = '▐', change = '▐', delete = '▐' }, -- Signs used for hunks with 'sign' view
  --     priority = 199, -- Priority of used visualization extmarks
  --   },
  --   mappings = {
  --     apply = 'gh', -- Apply hunks inside a visual/operator region
  --     reset = 'gH', -- Reset hunks inside a visual/operator region
  --     -- Hunk range textobject to be used inside operator
  --     -- Works also in Visual mode if mapping differs from apply and reset
  --     textobject = 'gh',
  --     -- Go to hunk range in corresponding direction
  --     goto_first = '[H',
  --     goto_prev = '[h',
  --     goto_next = ']h',
  --     goto_last = ']H',
  --   },
  --   options = {
  --     algorithm = 'histogram', -- Diff algorithm. See `:h vim.diff()`.
  --     indent_heuristic = true, -- Whether to use "indent heuristic". See `:h vim.diff()`.
  --     linematch = 60, -- The amount of second-stage diff to align lines (in Neovim>=0.9)
  --     wrap_goto = false, -- Whether to wrap around edges during hunk navigation
  --   },
  -- }
  -- local rhs = function()
  --   return MiniDiff.operator 'yank' .. 'gh'
  -- end
  -- vim.keymap.set('n', 'ghy', rhs, { expr = true, remap = true, desc = "Copy hunk's reference lines" })
  -- -- [[ Doc ]]==========================================================
  -- require("mini.doc").setup({})
  -- -- [[ Hipatterns ]]====Serious problem with big file==================
  -- local hipatterns = require 'mini.hipatterns'
  -- local hi_words = MiniExtra.gen_highlighter.words
  -- hipatterns.setup {
  --   highlighters = {
  --     fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
  --     hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
  --     todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
  --     note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),
  --     hex_color = hipatterns.gen_highlighter.hex_color(),
  --   },
  -- }
  -- -- [[ Tabline ]]======================================================
  -- require('mini.tabline').setup {
  --   show_icons = true,
  --   format = nil, -- By default surrounds with space and possibly prepends with icon
  --   set_vim_settings = true, -- set Vim's settings for tabline
  --   tabpage_section = 'left', -- One of 'left', 'right', 'none'.
  -- }
  -- -- [[ Test ]]=========================================================
  -- local test = require 'mini.test'
  -- local reporter = test.gen_reporter.buffer {
  --   window = { border = 'double' },
  -- }
  -- test.setup {
  --   -- Path (relative to current directory) to script which handles project specific test running
  --   script_path = 'scripts/minitest.lua',
  --   execute = {
  --     reporter = reporter, -- Table with callable fields `start()`, `update()`, and `finish()`
  --     stop_on_error = false, -- Whether to stop execution after first error
  --   },
  --   -- Options for collection of test cases. See `:h MiniTest.collect()`.
  --   collect = {
  --     -- Temporarily emulate functions from 'busted' testing framework
  --     -- (`describe`, `it`, `before_each`, `after_each`, and more)
  --     emulate_busted = true,
  --     -- Function returning array of file paths to be collected.
  --     -- Default: all Lua files in 'tests' directory starting with 'test_'.
  --     find_files = function()
  --       return vim.fn.globpath('tests', '**/test_*.lua', true, true)
  --     end,
  --     -- Predicate function indicating if test case should be executed
  --     filter_cases = function(case)
  --       return true
  --     end,
  --   },
  -- }
end)
