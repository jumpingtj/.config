return {
	"L3MON4D3/LuaSnip",
	event = 'VeryLazy',
	config = function()
		local ls = require("luasnip")

		vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
		ls.setup({ enable_autosnippets = true })
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
	end
}
