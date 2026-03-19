-- Neovim configuration
-- Symlink: ln -s ~/Desktop/projects/tmux-worktree/init.lua ~/.config/nvim/init.lua

-- ─────────────────────────────────────────────────────────────
-- Line Numbers
-- ─────────────────────────────────────────────────────────────

vim.opt.number = true
vim.opt.relativenumber = true

-- ─────────────────────────────────────────────────────────────
-- Bootstrap lazy.nvim
-- ─────────────────────────────────────────────────────────────

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ─────────────────────────────────────────────────────────────
-- Plugins
-- ─────────────────────────────────────────────────────────────

require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<C-S-f>", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    },
  },
})
