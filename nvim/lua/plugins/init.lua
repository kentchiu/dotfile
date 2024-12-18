return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewOpen<cr>", { desc = "DV - Open Changes" })
      vim.keymap.set("n", "<leader>g%", "<cmd>DiffviewFileHistory %<cr>", { desc = "DV - Current File History" })
      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewFileHistory %<cr>", { desc = "DV - Current File History" })
      vim.keymap.set("v", "<leader>gv", "<cmd>'<,'>DiffviewFileHistory<cr>", { desc = "DV - Current Selection" })
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      -- "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
    keys = {
      { "<leader>gg", "<cmd>Neogit<CR>", desc = "Open Neogit" },
    },
  },

  {
    "echasnovski/mini.files",
    keys = {
      {
        "-",
        function()
          require("mini.files").open(LazyVim.root(), true)
        end,
        desc = "Open mini.files (root)",
      },
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (directory of current file)",
      },
    },
    opts = {
      windows = {
        width_preview = 75,
      },
    },
  },
}
