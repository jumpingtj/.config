-- kickstart.nvim ;)

vim.loader.enable(true)

-- Disable built-in plugins for faster startup
local disabled_builtins = {
  'gzip',
  'tar',
  'tarPlugin',
  'zip',
  'zipPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'logiPat',
  'rrhelper',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers',
  'matchit',
  'matchparen',
  'tutor_mode_plugin',
}

for _, plugin in ipairs(disabled_builtins) do
  vim.g['loaded_' .. plugin] = 1
end

-- [[ Install `lazy.nvim` plugin manager ]]
-- :help lazy.nvim.txt or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
require 'toby'
