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
  -- the server errors out with "Initialize request must include a workspace root URI"
  -- when it is started outside of a project, so only start it once a Laravel/PHP
  -- project root is actually found (`root_markers` alone would still start it).
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { "artisan", "composer.json" })
    if root then on_dir(root) end
  end,
  -- reuse AstroNvim's completion capabilities and its `on_attach` so the
  -- standard LSP mappings (gd, gr, <Leader>la, ...) work here too
  capabilities = astrolsp_avail and astrolsp.config.capabilities or nil,
  on_attach = astrolsp_avail and astrolsp.on_attach or nil,
}
