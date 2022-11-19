local cmd = vim.cmd

-- avoid mistyping write/quit
cmd("command WQ wq")
cmd("command Wq wq")
cmd("command W w")
cmd("command Q q")

-- set leader to <Space>
vim.api.nvim_set_keymap(
  "",
  "<Space>",
  "<Nop>",
  { noremap = true, silent = true }
)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap(
  "i",
  "<c-s>",
  "<ESC>:w<CR>a",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<c-s>",
  ":w<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<c-s>",
  "<Esc>:w<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "i",
  "<c-w>",
  "<ESC>:wq<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<c-w>",
  ":wq<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "<c-w>",
  "<Esc>:wq<CR>",
  { noremap = true, silent = true }
)
