local targetPane = ''
vim.keymap.set('n', '<leader>vp', function()
	targetPane = vim.fn.input 'Enter pane number (%n): '
end, {
	desc = '[J]ust [S]et Pane',
})
vim.keymap.set('n', '<leader><leader>', function()
	vim.cmd 'update'
	require('plenary.job')
			:new({
				command = 'tmux',
				args = { 'send-keys', '-t', targetPane, 'just run', 'Enter' },
			})
			:start()
end, {
	desc = '[J]ust [R]un',
})
