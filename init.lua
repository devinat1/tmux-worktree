-- Neovim configuration
-- Symlink: ln -s ~/Desktop/projects/tmux-worktree/init.lua ~/.config/nvim/init.lua

-- ─────────────────────────────────────────────────────────────
-- Line Numbers
-- ─────────────────────────────────────────────────────────────

vim.opt.number = true

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

-- ─────────────────────────────────────────────────────────────
-- Auto-format Go files on save
-- ─────────────────────────────────────────────────────────────

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local content = table.concat(vim.api.nvim_buf_get_lines(buf, 0, -1, false), "\n") .. "\n"
    local result = vim.fn.system("gofmt", content)
    if vim.v.shell_error == 0 then
      local lines = vim.split(result, "\n")
      if lines[#lines] == "" then table.remove(lines) end
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    end
  end,
})
