return {
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
    config = function()
      require("minty").setup({
        show_palette = true,
        copy_on_select = true,
        use_border = true,
      })
    end,
  },
  {
    "nvzone/volt",
    lazy = true
  }
}
