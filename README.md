# Kadir's Neovim config

[AstroNvim](https://github.com/AstroNvim/AstroNvim) **v6** on Neovim **0.12+**, set up for
Laravel/PHP, Vue/TypeScript, Go and Python.

## Installation

```shell
# back up anything you already have
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

git clone git@github.com:kadirtikil/KadirNvimConfig.git ~/.config/nvim
nvim
```

First launch installs plugins, language servers and treesitter parsers. Give it a minute.

Laravel's own language server is **not** installed by Mason, it comes from Composer:

```shell
composer global require laravel/lsp
```

It only starts inside a project that has an `artisan` or `composer.json` file.

## Layout

| File | What's in it |
| --- | --- |
| `init.lua` | Bootstraps lazy.nvim. **Also holds the `a`/`i` key swap** (see below) |
| `lua/lazy_setup.lua` | AstroNvim version pin (`^6`), leader keys |
| `lua/community.lua` | Language packs and colorschemes from AstroCommunity |
| `lua/plugins/astroui.lua` | **Theme and background** |
| `lua/plugins/astrolsp.lua` | LSP settings, formatting on save, LSP mappings |
| `lua/plugins/mason.lua` | Extra language servers/formatters to auto-install |
| `lua/plugins/user.lua` | Your own plugins go here |
| `lua/polish.lua` | Runs last; enables `laravel_lsp` |
| `lsp/laravel_lsp.lua` | Laravel language server config |

## ⚠️ This config swaps `a` and `i`

Set in `init.lua`. Unlike stock Vim:

| Key | Does |
| --- | --- |
| `a` | Insert **before** cursor (normally `i`) |
| `i` | Insert **after** cursor (normally `a`) |
| `A` | Jump to **start** of line and insert (normally `I`) |
| `I` | Jump to **end** of line and insert (normally `A`) |

Delete those lines in `init.lua` to get the normal behaviour back.

---

# Shortcuts

Leader is <kbd>Space</kbd>, local leader is <kbd>,</kbd>.

**Forgot a key? Just press <kbd>Space</kbd> and wait** — which-key pops up a menu of everything
available. `<Leader>fk` searches all keymaps.

Some mappings only exist where they make sense: git ones need a git repo, LSP ones need a
running language server.

## Git

Everything git lives under `<Leader>g`. Hunk = one changed block in the current file.

| Key | Does |
| --- | --- |
| `<Leader>gt` | Git **status** — the main one, browse and open changed files |
| `<Leader>gd` | View git **diff** of current file |
| `<Leader>gb` | Git **branches** — switch branch |
| `<Leader>gc` | Git **commits** (whole repo) |
| `<Leader>gC` | Git commits **touching current file** |
| `<Leader>gT` | Git **stash** list |
| `<Leader>go` | Open current file **on GitHub** in your browser (works on a visual selection too) |
| `<Leader>gl` | Blame current **line** |
| `<Leader>gL` | Blame current line, **full detail** |
| `<Leader>gp` | **Preview** the hunk under the cursor |
| `<Leader>gs` | **Stage / unstage** hunk under cursor (also works on a visual selection) |
| `<Leader>gS` | **Stage the whole file** |
| `<Leader>gr` | **Reset** hunk — throws away that change (also visual) |
| `<Leader>gR` | **Reset the whole file** — throws away all its changes |
| `<Leader>fg` | Find files **tracked by git** |
| `]g` / `[g` | Jump to **next / previous** changed hunk |
| `]G` / `[G` | Jump to **last / first** hunk in file |
| `ig` | Text object: `dig` deletes a hunk, `vig` selects one |

Changed lines are marked in the left column: added, changed, deleted.

### There is no commit/push mapping

This config has no git client built in, so committing and pushing happen in a terminal.
`<Leader>tf` opens a floating terminal right inside Neovim:

```shell
git add -p          # stage interactively, hunk by hunk
git commit -m "..."
git push
```

<kbd>Ctrl</kbd>+<kbd>'</kbd> or <kbd>F7</kbd> toggles that terminal from anywhere, including
from inside the terminal itself.

If you'd rather do it visually, install [lazygit](https://github.com/jesseduffield/lazygit)
(`brew install lazygit`) and AstroNvim picks it up automatically — a full git UI for staging,
committing, pushing, rebasing and resolving conflicts.

## Files & searching

| Key | Does |
| --- | --- |
| `<Leader>e` | Toggle file **explorer** |
| `<Leader>o` | Jump **into** the explorer (and back) |
| `<Leader>ff` | **Find files** by name |
| `<Leader>fF` | Find files, **including hidden/ignored** |
| `<Leader>fw` | **Find words** — search file contents (ripgrep) |
| `<Leader>fW` | Find words, including hidden/ignored files |
| `<Leader>fc` | Find the **word under the cursor** |
| `<Leader>fb` | Find open **buffers** |
| `<Leader>fo` | **Recently opened** files |
| `<Leader>fO` | Recently opened, in this folder only |
| `<Leader>fs` | Buffers + recent + files in one list |
| `<Leader>fl` | Find **lines** in current file |
| `<Leader>ft` | Find **themes** — live preview while scrolling |
| `<Leader>fh` | Find **help** pages |
| `<Leader>fk` | Find **keymaps** — every shortcut you have |
| `<Leader>fC` | Find **commands** |
| `<Leader>fT` | Find **TODO** comments |
| `<Leader>fp` | Find **projects** |
| `<Leader>f'` | Find **marks** |
| `<Leader>fr` | Find **registers** |
| `<Leader>fu` | Browse **undo history** |
| `<Leader>fn` | Find **notifications** |
| `<Leader>fa` | Find files **in this config** |
| `<Leader>f<CR>` | **Resume** last search |
| `<Leader>n` | New file |
| `<Leader>R` | Rename current file |
| `<Leader>w` | **Save** |
| `<Leader>q` | Quit window |
| `<Leader>Q` | Quit Neovim |
| `<Leader>h` | Home screen |
| `gx` | Open the **link/file path under the cursor** in your browser or Finder |

Inside a search: <kbd>Ctrl</kbd>+<kbd>j</kbd>/<kbd>k</kbd> move, <kbd>Enter</kbd> opens,
<kbd>Esc</kbd> closes.

## Buffers (open files) & windows

| Key | Does |
| --- | --- |
| `]b` / `[b` | Next / previous buffer |
| `<Leader>c` | **Close** buffer |
| `<Leader>C` | Force close (discard changes) |
| `<Leader>bb` | Pick a buffer from the tabline |
| `<Leader>bd` | Pick a buffer to close |
| `<Leader>bc` | Close all **except** this one |
| `<Leader>bC` | Close **all** buffers |
| `<Leader>bl` / `<Leader>br` | Close all to the **left** / **right** |
| `>b` / `<b` | Move this buffer right / left in the tabline |
| `<Leader>b\` / `<Leader>b\|` | Open a buffer in a horizontal / vertical split |
| `\|` | **Vertical** split |
| `\` | **Horizontal** split |
| <kbd>Ctrl</kbd>+<kbd>h/j/k/l</kbd> | Move between splits |
| <kbd>Ctrl</kbd>+<kbd>←↓↑→</kbd> | **Resize** the split |
| `]t` / `[t` | Next / previous tab |

## Code & LSP

Needs a language server for the file you're in.

| Key | Does |
| --- | --- |
| `gd` | **Go to definition** |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `gD` | Go to declaration |
| `K` | **Hover docs** for symbol under cursor |
| `gK` / <kbd>Ctrl</kbd>+<kbd>s</kbd> (insert) | Signature help |
| `<Leader>lR` | **Find all references** |
| `<Leader>lr` | **Rename symbol** everywhere |
| `<Leader>la` | **Code action** — fixes, imports, refactors (also visual) |
| `<Leader>lA` | Source action |
| `<Leader>lf` | **Format** file (also visual) |
| `<Leader>ls` | Search symbols in file |
| `<Leader>lG` | Search symbols across project |
| `<Leader>lS` | Symbols **outline** sidebar |
| `<Leader>ld` | Show diagnostics for this line |
| `<Leader>lD` | Search **all diagnostics** |
| `<Leader>li` | LSP info — which servers are attached |
| `<Leader>lI` | null-ls info (formatters/linters) |
| `]d` / `[d` | Next / previous **diagnostic** |
| `]e` / `[e` | Next / previous **error** |
| `]w` / `[w` | Next / previous **warning** |
| `]r` / `[r` | Next / previous **use of this symbol** |
| `gc` | **Comment** (visual), `gcc` line, `gco`/`gcO` add below/above |
| `<Leader>/` | Toggle comment |
| `]f` / `[f` | Next / previous **function** |
| `]a` / `[a` | Next / previous **argument** |
| `]k` / `[k` | Next / previous **block** |
| `>F` / `<F` | **Swap** function with the next / previous one |
| `>A` / `<A` | Swap argument with the next / previous one |
| `>K` / `<K` | Swap block with the next / previous one |
| `]T` / `[T` | Next / previous TODO comment |

**Text objects** (use after `d`, `c`, `v`, `y`): `af`/`if` function, `aa`/`ia` argument,
`ak`/`ik` block, `ao`/`io` loop, `a?`/`i?` conditional, `ig` git hunk.
So `vif` selects a function body, `daa` deletes an argument.

In visual mode `an` grows the selection to the parent syntax node and `in` shrinks it —
the fastest way to select an expression, then a statement, then a block.

## Laravel

| Key | Does |
| --- | --- |
| `<Leader>La` | **Artisan** command picker |
| `gf` | On a Blade view name, route name or config key: **jump to that file** |

`<Leader>lf` formats PHP with **pint** and Blade with **blade-formatter**. Vue/TS/CSS/JSON/
Markdown go through **prettier**.

## Terminal

| Key | Does |
| --- | --- |
| <kbd>Ctrl</kbd>+<kbd>'</kbd> or <kbd>F7</kbd> | Toggle terminal (works inside it too) |
| `<Leader>tf` | **Floating** terminal |
| `<Leader>th` | Terminal in a horizontal split |
| `<Leader>tv` | Terminal in a vertical split |
| `<Leader>tn` | Node REPL |
| `<Leader>tp` | Python REPL |

In a terminal, <kbd>Ctrl</kbd>+<kbd>h/j/k/l</kbd> still moves between splits.
<kbd>Ctrl</kbd>+<kbd>\\</kbd> then <kbd>Ctrl</kbd>+<kbd>n</kbd> leaves insert mode.

## Debugging

| Key | Does |
| --- | --- |
| `<Leader>db` / <kbd>F9</kbd> | Toggle **breakpoint** |
| `<Leader>dC` | Conditional breakpoint |
| `<Leader>dB` | Clear all breakpoints |
| `<Leader>dc` / <kbd>F5</kbd> | **Start / continue** |
| `<Leader>do` / <kbd>F10</kbd> | Step **over** |
| `<Leader>di` / <kbd>F11</kbd> | Step **into** |
| `<Leader>dO` | Step **out** |
| `<Leader>ds` | Run to cursor |
| `<Leader>dp` / <kbd>F6</kbd> | Pause |
| `<Leader>dr` | Restart |
| `<Leader>dq` | Close session |
| `<Leader>dQ` | Terminate |
| `<Leader>du` | Toggle **debugger UI** |
| `<Leader>dh` | Hover value under cursor |
| `<Leader>dE` | Evaluate expression (visual: evaluate selection) |
| `<Leader>dR` | Toggle REPL |

## Toggles (`<Leader>u`)

| Key | Does |
| --- | --- |
| `<Leader>uw` | **Wrap** long lines |
| `<Leader>un` | Line **numbers** |
| `<Leader>ud` | **Diagnostics** on/off |
| `<Leader>uf` / `<Leader>uF` | **Format on save** (this file / everywhere) |
| `<Leader>uh` / `<Leader>uH` | Inlay hints |
| `<Leader>us` | Spellcheck |
| `<Leader>uS` | Conceal |
| `<Leader>ub` | **Light / dark** background |
| `<Leader>uZ` | **Zen mode** |
| `<Leader>ui` | Indent settings |
| `<Leader>u\|` | Indent guides |
| `<Leader>uc` / `<Leader>uC` | Autocompletion |
| `<Leader>ua` | Autopairs |
| `<Leader>uz` | Colour highlighting |
| `<Leader>ur` | Highlight other uses of this word |
| `<Leader>uD` | Dismiss notifications |
| `<Leader>ul` / `<Leader>ut` | Statusline / tabline |

## Sessions

| Key | Does |
| --- | --- |
| `<Leader>Ss` | **Save** session |
| `<Leader>Sl` | Load **last** session |
| `<Leader>S.` | Load session for **this folder** |
| `<Leader>Sf` | Pick a session to load |
| `<Leader>Sd` | Delete a session |

## Plugins & tools

| Key | Does |
| --- | --- |
| `<Leader>ps` | Plugin status (`:Lazy`) |
| `<Leader>pu` | Check for plugin updates |
| `<Leader>pU` | **Update plugins** |
| `<Leader>pi` | Install plugins |
| `<Leader>pS` | Sync plugins |
| `<Leader>pm` | **Mason** — install language servers |
| `<Leader>pM` | Update Mason packages |
| `<Leader>pa` | Update **everything** (Lazy + Mason) |
| `<Leader>xq` / `<Leader>xl` | Quickfix / location list |

After updating plugins, restart Neovim. `lazy-lock.json` records exact versions, so commit it
to keep your machines identical.

---

## Theme

Set in `lua/plugins/astroui.lua`:

```lua
colorscheme = "astrodark",
```

Works out of the box: `astrodark`, `astrolight`, `astromars`, `astrojupiter`,
`catppuccin-mocha`, `catppuccin-macchiato`, `catppuccin-frappe`, `catppuccin-latte`.

For anything else, add it to `lua/community.lua` first:

```lua
{ import = "astrocommunity.colorscheme.tokyonight-nvim" },
```

then name it in `astroui.lua` and restart. `<Leader>ft` previews themes live without saving.

## Background

Same file, in `highlights.init`. Currently transparent, so the terminal shows through:

```lua
highlights = {
  init = {
    Normal = { bg = "NONE" },
    NormalNC = { bg = "NONE" },
    SignColumn = { bg = "NONE" },
    NeoTreeNormal = { bg = "NONE" },
    NeoTreeNormalNC = { bg = "NONE" },
    WinBarNC = { bg = "NONE" },
    WinSeparator = { bg = "NONE" },
  },
},
```

Swap those for `Normal = { bg = "#1a1b26" }` to get a solid colour instead. Neovim can't do
partial transparency: it's all or nothing, and the in-between is your terminal's opacity
setting. Background **images** are a terminal feature too (Warp: Settings → Appearance →
Themes), and they only show through while Neovim is transparent.

## Adding a language

Add a pack to `lua/community.lua` and restart:

```lua
{ import = "astrocommunity.pack.rust" },
```

Already on: lua, laravel (php + blade), vue (+ typescript), tailwindcss, go, python, json,
yaml, prettier. Full list at
[astrocommunity](https://github.com/AstroNvim/astrocommunity/tree/main/lua/astrocommunity/pack).

## When something breaks

| Command | What it tells you |
| --- | --- |
| `:checkhealth` | Full report on everything |
| `:Lazy` | Plugin state, `x` next to a plugin means an error |
| `:LspInfo` | Which language servers attached to this file |
| `:Mason` | Installed servers/formatters |
| `:messages` | Errors that flashed past |
