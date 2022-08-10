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

api.nvim_set_keymap("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
api.nvim_set_keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>", opts)
api.nvim_set_keymap("n", "<leader>r", ":lua require('telescope.builtin').resume()<CR>", opts)

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

vim.cmd('hi Normal guibg=NONE ctermbg=NONE')

