return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      palette_overrides = {
        bg0 = "#2A2923",  -- Set your desired background color
      },
      overrides = {
        Normal = { bg = "#2A2923" },  -- Ensure the Normal highlight group matches
      }
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
