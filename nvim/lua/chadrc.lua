-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

local stbufnr = function()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end

M.ui = {
  telescope = {
    style = "bordered",
  },
  statusline = {
    separator_style = "round",
    theme = "minimal",
    order = { "relativepath", "git", "%=", "lsp_msg", "%=", "diagnostics", "cwd" },
    modules = {
      relativepath = function()
        local path = vim.api.nvim_buf_get_name(stbufnr())

        if path == "" then
          return ""
        end

        -- Get the relative directory path
        local dir = vim.fn.expand "%:.:h"
        -- Get the filename
        local filename = vim.fn.expand "%:t"

        -- Combine them with proper formatting
        if dir == "." then
          -- Just show the filename if we're in the current directory
          return "%#St_relativepath#  " .. filename
        else
          -- Show directory + filename
          return "%#St_relativepath#  " .. dir .. "/" .. filename
        end
      end,
    },
  },
}

M.base46 = {
  theme = "everforest",
}

return M
