return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = {
      servers = {
        lua_ls = {},
        zls = {
          settings = {
            filetypes = { "zig", "zon" },
            zls = {
              enable_snippets = true,
            },
          },
        },
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "zls" },
      })

      local lspconfig = require("lspconfig")
      local servers = {
        lua_ls = {},
        zls = {
          settings = {
            filetypes = { "zig", "zon" },
            zls = { enable_snippets = true },
          },
        },
      }

      local on_attach = function(_, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

      local cmp_capabilities = require("blink.cmp").get_lsp_capabilities()

      for _, server_name in ipairs(require("mason-lspconfig").get_installed_servers()) do
        local server_opts = servers[server_name] or {}
        server_opts.on_attach = on_attach
        server_opts.capabilities = vim.tbl_extend("force", cmp_capabilities, server_opts.capabilities or {})
        lspconfig[server_name].setup(server_opts)
      end
    end,
  },
}
