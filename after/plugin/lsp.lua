local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- Set up keymaps or other configurations as needed
end)

-- Language servers setup
local lspconfig = require('lspconfig')
lspconfig.clangd.setup({})
lspconfig.phpactor.setup({})
lspconfig.gopls.setup({})
