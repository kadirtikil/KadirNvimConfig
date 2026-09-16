-- Customize Mason
-- NOTE: the language packs imported in `lua/community.lua` add their own tools
-- on top of this list (phpactor, pint, gopls, delve, basedpyright, vtsls,
-- vue-language-server, tailwindcss, prettier, ...)

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
