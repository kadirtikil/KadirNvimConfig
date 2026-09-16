-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
return {
  -- AstroNvim pins aerial to `^2.2`, but that line predates Neovim 0.12's
  -- tree-sitter API changes and throws
  -- "attempt to call method 'start' (a nil value)" on every buffer.
  -- aerial `^4` is the release line that targets Neovim 0.12.
  { "stevearc/aerial.nvim", version = "^4", pin = false },
}
