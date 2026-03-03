vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "text"},
    callback = function()
        vim.opt_local.spell = false
    end
})


require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "basedpyright", "zls" },
}

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.publishDiagnostics = {
    virtualText = true,
    signs = true,
    underline = true,
}

-- mason-lspconfig v2 uses vim.lsp.config() instead of setup_handlers
local servers = { "lua_ls", "rust_analyzer", "clangd", "basedpyright", "zls" }
for _, server_name in ipairs(servers) do
    vim.lsp.config(server_name, {
        capabilities = capabilities,
    })
end


