-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.relativenumber = true -- Relative line numbers
vim.opt.swapfile = false -- disable swapfiles
vim.opt.inccommand = "split" -- Incremental live completion
vim.opt.spelllang = "en_us,cjk" -- cjk for Chinese, Japanese and korean

-- vim.opt.listchars = { space = "·", tab = "⇥ ", eol = "↵" }
vim.opt.listchars = {
  eol = "↲",
  tab = "⇥ ",
  space = "·",
  trail = "·",
  extends = ">",
  precedes = "<",
  nbsp = "␣",
}

-- vim.opt.diffopt = "filler,internal,closeoff,algorithm:histogram,context:5,linematch:60"
-- example here: https://vimways.org/2018/the-power-of-diff/
vim.opt.diffopt = {
  "internal", -- use internal diff
  "filler", -- fill diff with empty row which make diff more Intuitive
  "closeoff", -- auto close diff when buffer close
  "context:12", -- diff conext line
  "algorithm:histogram", -- suit for small chunk
  "linematch:200",
  "indent-heuristic", -- smart indent
  -- "iwhite", -- this one, it doesn't fit all cases.
}

-- SSH remove copy support.
-- https://github.com/neovim/neovim/pull/33021
vim.g.clipboard = "osc52"
