-- Laravel's first-party language server
-- Installed outside of Mason with: composer global require laravel/lsp
-- https://github.com/laravel/lsp
--
-- Neovim 0.12 picks this file up automatically from `lsp/` on the runtimepath.
-- It is turned on by the `vim.lsp.enable` call in `lua/polish.lua`.

local astrolsp_avail, astrolsp = pcall(require, "astrolsp")

---@type vim.lsp.Config
return {
  cmd = { "laravel-lsp" },
  filetypes = { "php", "blade" },
  root_markers = { "artisan", "composer.json", ".git" },
  -- reuse AstroNvim's completion capabilities and its `on_attach` so the
  -- standard LSP mappings (gd, gr, <Leader>la, ...) work here too
  capabilities = astrolsp_avail and astrolsp.config.capabilities or nil,
  on_attach = astrolsp_avail and astrolsp.on_attach or nil,
}
