return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",         -- required
		"sindrets/diffview.nvim",        -- optional - Diff integration

		-- Only one of these is needed.
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
	vim.keymap.set("n", "<leader>gg", "<CMD>Neogit<CR>", { desc = "Open Neogit" }),
	vim.keymap.set("n", "<leader>gl", "<CMD>Neogit log<CR>", { desc = "Open Neogit log" })
}

