--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command
local g = vim.g

-- Options
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.number = true
opt.ruler = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.shell = '/bin/bash'

cmd "set noshowmode"

-- Theme
g.t_co = 256
g.background = "dark"
opt.syntax = "ON"
opt.termguicolors = true
cmd('colorscheme catppuccin')

-- Update the packer path
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path