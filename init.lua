-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

-- 'a' now enters insert mode before cursor (like 'i' normally does)
vim.keymap.set('n', 'a', 'i', { noremap = true })
-- 'i' now enters insert mode after cursor (like 'a' normally does)
vim.keymap.set('n', 'i', 'a', { noremap = true })

-- Same for visual mode if you want
vim.keymap.set('v', 'a', 'i', { noremap = true })
vim.keymap.set('v', 'i', 'a', { noremap = true })

-- Swap A and I as well (start/end of line variants)
vim.keymap.set('n', 'A', 'I', { noremap = true })
vim.keymap.set('n', 'I', 'A', { noremap = true })

require "lazy_setup"
require "polish"
