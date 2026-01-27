vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.mouse = 'a' -- Enable mouse (resize splits etc.)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 7
vim.o.confirm = true
vim.o.shiftwidth = 2
vim.o.statusline = [[%{mode()} %<%f %= %y]]
vim.o.winbar = [[%=%m %f]]
vim.o.laststatus = 3
vim.o.signcolumn = "yes"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath 'state' .. '/undo'

vim.cmd.colorscheme 'catppuccin'
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = 'unnamedplus'
end)

-- Higlight yanked text breifly
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
})
