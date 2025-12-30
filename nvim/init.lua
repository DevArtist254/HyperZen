require("mytheme").setup()

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set relativenumber")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins", opts)
require("lsp.capabilities")
require("lsp.autocmd")
require("lsp.servers.lua_ls")
require("lsp.servers.typos_lsp")
require("lsp.servers.ts_ls")
require("lsp.servers.emmet_ls")
require("lsp.servers.cssls")
require("lsp.servers.css_var")

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true
})
