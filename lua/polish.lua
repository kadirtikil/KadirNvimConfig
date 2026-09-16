-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Laravel's first-party language server (`composer global require laravel/lsp`).
-- It is defined in `lsp/laravel_lsp.lua`. `vim.lsp.enable` is lazy: the config is
-- only resolved once a php/blade buffer is opened, so this is cheap at startup.
if vim.fn.executable "laravel-lsp" == 1 then vim.lsp.enable "laravel_lsp" end
