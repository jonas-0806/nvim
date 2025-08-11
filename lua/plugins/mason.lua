return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'saghen/blink.cmp' },
		-- example using `opts` for defining servers
		opts = {
			servers = {
				omnisharp = {},
				lua_ls = {},
				zls = {
					settings = {
						filetypes = {"zig","zon"},
						zls = {
							enable_snippets = true,
						},
					},
				},
			},
		},
		config = function(_, opts)
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				vim.lsp.enable(server)
			end
		end

	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies =  { "mason.nvim" },
	}
}

