
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "text"},
    callback = function()
        vim.opt_local.spell = false
    end
})


require("mason").setup()
require("mason-lspconfig").setup{
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "ast_grep", "biome",
    "lua_ls", "jedi_language_server", "rust_analyzer", "esbonio", "zls" 
    },
}
-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...

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

require('mason-lspconfig').setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
    }
  end,
})
