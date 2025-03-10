vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.keymap.set("n", "<leader>dt", require("dap").toggle_breakpoint, { desc = "[D]ebug [T]oggle breakpoint" })
vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "[D]ebug [C]ontinue" })
vim.keymap.set("n", "sd", "<cmd>vsp<CR><cmd>lua vim.lsp.buf.definition()<CR>zz", { noremap = true, silent = true })
vim.fn.sign_define(
  "DapBreakpoint",
  { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

local nmap = function(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = desc })
end
nmap("<leader>i", vim.diagnostic.open_float, "hover diagnostics")

vim.lsp.inlay_hint.enable(true)

-- Global tab settings
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.softtabstop = 4 -- Number of spaces in tab when editing
vim.opt.relativenumber = true

local nvim_tree = require "nvim-tree"
nvim_tree.setup(require "configs.nvimtree")

-- Delete without copying to clipboard
vim.keymap.set("n", "dc", '"_dd', { noremap = true })
vim.keymap.set("v", "dc", '"_d', { noremap = true })

require("noice").setup(require "configs.noicenvim")

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font:h16"
  require("FTerm").setup {
    border = "single",
    dimensions = {
      height = 0.99,
      width = 0.95,
    },
    cmd = "sh -c 'tmux new -As scratch'",
    blend = 10,
  }
  vim.keymap.set("n", "<C-\\>", require("FTerm").toggle, { noremap = true, silent = true })
  vim.keymap.set("i", "<C-\\>", require("FTerm").toggle, { noremap = true, silent = true })
  vim.keymap.set("t", "<C-\\>", require("FTerm").toggle, { noremap = true, silent = true })

  vim.g.neovide_padding_top = 3
  vim.g.neovide_padding_bottom = 3
  vim.g.neovide_padding_right = 3
  vim.g.neovide_padding_left = 3
end
