return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
		local configs = require("nvim-treesitter.configs")
		configs.ensure_installer = { "c", "lua", "zig", "rust" }
		configs.highlight = { enable = true }
		configs.indent = { enable = true }
	end,
}
