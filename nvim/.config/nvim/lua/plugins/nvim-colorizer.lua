return {
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.opt.termguicolors = true
      require("colorizer").setup({
        "*",
      }, {
        RGB = true,
        RRGGBB = true,
        names = false,
        css = true,
        css_fn = true,
        mode = "background", -- try "foreground" if you prefer
      })
    end,
  }
}
