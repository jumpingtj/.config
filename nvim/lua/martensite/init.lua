return {
	setup = require('martensite.options').set,
	load = function(opts)
		local options = require 'martensite.options'
		if opts then
			options.set(opts)
		end
		local opts = options.opts
		vim.cmd.hi 'clear'
		vim.o.termguicolors = true
		local groups = require 'martensite.groups'
		local palette = opts.palettes[opts.theme]
		for _, group in ipairs(groups) do
			for name, value in pairs(group(palette)) do
				vim.api.nvim_set_hl(0, name, value)
			end
		end
		vim.api.nvim_create_user_command('MGet', function(opts)
			local mo = require('martensite.options').opts
			vim.notify(mo.palettes[mo.theme][opts.args])
		end, {})
	end,
}
