return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
	  label = {
        uppercase = false,
		style = "overlay",
		after = false,
		before = true,
		distance = false,
	  },
	  highlight = {
        matches = false
	  },
	  search = {
		mode="exact"
	  }
	},
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
	},
}
