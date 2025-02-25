return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    explorer = {},
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          -- jump = { close = false },
          layout = {
            -- preset = "ivy",
            preview = true,
          },
        },
      },
    },
  },
  -- stylua: ignore
  keys = {

    { "<leader>fa", function() Snacks.picker() end, desc = "All pickers" },
    { "<leader>su", function() Snacks.picker("undo") end, desc = "Undo" },
    { "<leader>fR", LazyVim.pick("oldfiles"), desc = "Recent" },
    { "<leader>fr", LazyVim.pick("oldfiles", { filter = { cwd = true }}), desc = "Recent (cwd)" },
  },
}
