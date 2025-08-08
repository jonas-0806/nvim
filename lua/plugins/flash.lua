return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
	  label = {
        uppercase = false,
		after = false,
		before = true,
	  },
	  highlight = {
        matches = false
	  },
	  search = {
        case = "smart"
	  }
	},
	-- stylua: ignore
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	},
}
