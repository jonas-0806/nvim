return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { 'saghen/blink.cmp' },
		-- example using `opts` for defining servers
		opts = {
			servers = {
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
			local lspconfig = require('lspconfig')
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
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
		config = function()
			require("mason-lspconfig").setup({
				function(server_name)
					require("lspconfig")[server_name].setup({
						vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc='Goto definition' });
						vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true, silent = true, desc='Goto references' });
					})
				end,
			})
		end,
	}
}
