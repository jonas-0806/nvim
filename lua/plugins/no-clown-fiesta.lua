local opts = {
	transparent = true,
	styles = {
		type = { bold = true },
		lsp = { underline = false },
		match_paren = { underline = true},
	},
}
return {
	"aktersnurra/no-clown-fiesta.nvim",
	lazy = false,
	config = function()
		local plugin = require("no-clown-fiesta")
		plugin.setup(opts)
		return plugin.load()
	end
}
