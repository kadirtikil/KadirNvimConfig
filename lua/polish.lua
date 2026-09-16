-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Laravel's first-party language server (`composer global require laravel/lsp`).
-- It is defined in `lsp/laravel_lsp.lua`. `vim.lsp.enable` is lazy: the config is
-- only resolved once a php/blade buffer is opened, so this is cheap at startup.
if vim.fn.executable "laravel-lsp" == 1 then vim.lsp.enable "laravel_lsp" end

-- AstroNvim v5 uses the archived `master` branch of nvim-treesitter. Its custom query
-- directives/predicates expect `match[id]` to be a single node, but on Neovim 0.12 it is
-- always a list of nodes. That throws "attempt to call method 'range' (a nil value)"
-- in markdown (fenced code blocks) and other injected languages. Re-register them
-- with a shim that hands the handlers the last node of each capture instead.
-- Can be removed once on AstroNvim v6 (nvim-treesitter `main` branch).
if vim.fn.has "nvim-0.12" == 1 then
  local query = require "vim.treesitter.query"
  local add_directive, add_predicate = query.add_directive, query.add_predicate
  local function wrap(register)
    return function(name, handler, _)
      register(name, function(match, ...)
        local nodes = setmetatable({}, {
          __index = function(_, id)
            local capture = match[id]
            return type(capture) == "table" and capture[#capture] or capture
          end,
        })
        return handler(nodes, ...)
      end, { force = true })
    end
  end
  query.add_directive, query.add_predicate = wrap(add_directive), wrap(add_predicate)
  package.loaded["nvim-treesitter.query_predicates"] = nil
  pcall(require, "nvim-treesitter.query_predicates")
  query.add_directive, query.add_predicate = add_directive, add_predicate
end
