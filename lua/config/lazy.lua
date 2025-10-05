-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "auto"
vim.opt.termguicolors = true
vim.opt.scrolloff = 9
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.iskeyword:remove('(')
vim.opt.iskeyword:remove(')')
vim.opt.iskeyword:remove('[')
vim.opt.iskeyword:remove(']')
vim.opt.iskeyword:remove('{')
vim.opt.iskeyword:remove('}')
vim.opt.iskeyword:remove(';')
vim.opt.iskeyword:remove(':')
vim.opt.iskeyword:remove('-')
vim.opt.iskeyword:remove('&')
vim.opt.iskeyword:remove('%')
vim.opt.iskeyword:remove('½')
vim.opt.iskeyword:remove('!')
vim.opt.iskeyword:remove('?')
vim.opt.iskeyword:remove('|')
vim.opt.iskeyword:remove('^')
vim.opt.iskeyword:remove('.')
vim.opt.iskeyword:remove(',')
vim.opt.iskeyword:remove('.')
vim.opt.iskeyword:remove('"')
vim.opt.iskeyword:remove('\'')

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "vague" } },
	-- automatically check for plugin updates
	checker = { enabled = false },
})

-- open help window in vertical split
vim.o.splitright = true
vim.cmd [[cabbrev h vert help]]

vim.cmd('colorscheme base16-onedark')

-- window navigation and resizing
vim.keymap.set('n', '<A-h>', '<C-w>h', { noremap = true, silent = true, desc = 'move to window to the left' })
vim.keymap.set('n', '<A-l>', '<C-w>l', { noremap = true, silent = true, desc = 'move to window to the right' })
vim.keymap.set('n', '<A-k>', '<C-w>k', { noremap = true, silent = true, desc = 'move to window above this' })
vim.keymap.set('n', '<A-j>', '<C-w>j', { noremap = true, silent = true, desc = 'move to window below this' })
vim.keymap.set('n', '<A-H>', '<C-w>H', { noremap = true, silent = true, desc = 'move window to the left' })
vim.keymap.set('n', '<A-L>', '<C-w>L', { noremap = true, silent = true, desc = 'move window to the right' })
vim.keymap.set('n', '<A-K>', '<C-w>K', { noremap = true, silent = true, desc = 'move window up' })
vim.keymap.set('n', '<A-J>', '<C-w>J', { noremap = true, silent = true, desc = 'move window down' })
vim.keymap.set('n', '<A-s>', '<C-w>s', { noremap = true, silent = true, desc = 'horizontal split' })
vim.keymap.set('n', '<A-v>', '<C-w>v', { noremap = true, silent = true, desc = 'vertical split' })
vim.keymap.set('n', '<A-+>', '<C-w>+', { noremap = true, silent = true, desc = 'increase height' })
vim.keymap.set('n', '<A-->', '<C-w>-', { noremap = true, silent = true, desc = 'decrease height' })
vim.keymap.set('n', '<A-,>', '<C-w><', { noremap = true, silent = true, desc = 'decrease width' })
vim.keymap.set('n', '<A-.>', '<C-w>>', { noremap = true, silent = true, desc = 'increase width' })

vim.keymap.set({ 'n', 'v' }, 'ø', '$', { noremap = true, silent = true, desc = 'move to end of line' })
vim.keymap.set({ 'n', 'v' }, 'æ', '0', { noremap = true, silent = true, desc = 'move to beginning of line' })
vim.keymap.set({ 'n', 'v' }, 'å', '%', { noremap = true, silent = true, desc = 'move to surrounding parentheses' })
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR><Esc>', { noremap = true, silent = true })

-- multi indent on same visual selection
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- lsp keybinds
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc='Goto definition' });
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true, desc='Goto references' });
vim.keymap.set('n', 'K', vim.lsp.buf.hover , { noremap = true, silent = true, desc='Hover' });
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { noremap = true, silent = true, desc='Rename' });


-- Define a custom highlight group for yank
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#00e969", fg = "black" })

-- Highlight on yank with custom color
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlightGroup", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})

vim.keymap.set('n', '<leader>hq', '<cmd>nohl<CR>', { noremap = true, silent = true, desc = 'nohl' });

-- zig
vim.keymap.set('n', '<leader>zt', '<cmd>!zig build run<CR>', { noremap = true, silent = true, desc = 'zig build test' });
vim.keymap.set('n', '<leader>zr', '<cmd>!zig build run<CR>', { noremap = true, silent = true, desc = 'zig build run' });
vim.keymap.set('n', '<leader>zb', '<cmd>!zig build<CR>', { noremap = true, silent = true, desc = 'zig build' });

-- zenmode
vim.keymap.set('n', '<leader>zz', '<cmd>ZenMode<CR>', { noremap = true, silent = true, desc = 'zenmode' });
