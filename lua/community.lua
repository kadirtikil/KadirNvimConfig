-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  { import = "astrocommunity.pack.lua" },

  -- Laravel / PHP: pulls in the php, blade and html-css packs as well
  { import = "astrocommunity.pack.laravel" },

  -- Vue: pulls in the typescript pack (vtsls) and wires up Volar hybrid mode
  { import = "astrocommunity.pack.vue" },

  -- Tailwind, used by default in the modern Laravel + Vue starter kits
  { import = "astrocommunity.pack.tailwindcss" },

  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.python" },

  -- Formatting for js/ts/vue/css/json/yaml/markdown
  { import = "astrocommunity.pack.prettier" },

  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },

  -- Colorschemes: import one here, then select it in `lua/plugins/astroui.lua`
  { import = "astrocommunity.colorscheme.catppuccin" },
}
