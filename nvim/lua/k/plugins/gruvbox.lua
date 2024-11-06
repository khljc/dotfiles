return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      palette_overrides = {
        bg0 = "#2A2923",  
      },
      overrides = {
        Normal = { bg = "#2A2923" },  
        }
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
