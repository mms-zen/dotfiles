local set = vim.opt
local api = vim.api
local keymap = vim.keymap

local cmd = vim.api.nvim_command
-- General options
set.backup = false
set.swapfile = false

set.relativenumber = true
set.number = true

set.hlsearch = true
set.ignorecase = true

set.syntax = "ON"
set.termguicolors = true

-- Tab stops because I am not an evel person
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.smartindent = true
set.autoindent = true
set.ai = true

set.scrolloff = 8

set.colorcolumn = "90"

-- Keymaps
opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- Create splits
api.nvim_set_keymap("n", "ss", ":split:<Return><C-w>w", opts)
api.nvim_set_keymap("n", "sv", ":vsplit<Return><C-w>w", opts)
-- Move between split
api.nvim_set_keymap("n", "sh", "<C-w>h", opts)
api.nvim_set_keymap("n", "sk", "<C-w>k", opts)
api.nvim_set_keymap("n", "sj", "<C-w>j", opts)
api.nvim_set_keymap("n", "sl", "<C-w>l", opts)

api.nvim_set_keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fr", ":lua require('telescope.builtin').resume()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fp", ":Telescope ghq list<CR>", opts)


vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

