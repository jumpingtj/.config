-- Clear search highlights when pressing <Esc> in normal mode
-- :help hlsearch
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>')
vim.keymap.set('n', '<leader>a', '<cmd>Atone<CR>')
vim.keymap.set('n', '<leader>p', '<cmd>TypstPreview<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>CsvViewToggle<CR>')
vim.keymap.set('n', '<leader>m', function()
	vim.cmd 'update'
	for k in pairs(package.loaded) do
		if k:match('^' .. 'martensite') then
			package.loaded[k] = nil
		end
	end
	vim.cmd.colorscheme 'graphite'
end)
vim.keymap.set({ 'n', 'o', 'v' }, 'gl', '$')
vim.keymap.set({ 'n', 'o', 'v' }, 'gh', '^')
vim.keymap.set('x', 'J', "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set('x', 'K', "<cmd>m '<-2<CR>gv=gv")
vim.keymap.set({ 'n', 'x', 'v' }, ':', ';')
vim.keymap.set({ 'n', 'x', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, '<leader>n', ':norm ')
vim.keymap.set({ 'n', 'v' }, '<leader>@', ':norm @')
