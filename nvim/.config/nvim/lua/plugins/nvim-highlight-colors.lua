-- lua/plugins/highlight-colors.lua
-- documentation: https://github.com/brenoprata10/nvim-highlight-colors
return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Ensure true color support
    vim.opt.termguicolors = true
    require("nvim-highlight-colors").setup({
      ---Set mode to virtual and inline to show color next to colors.
      render = 'virtual',
      virtual_symbol_position = 'inline',
      ---Set virtual symbol (requires render to be set to 'virtual')
      virtual_symbol = '■',
      ---Set virtual symbol suffix (defaults to '')
      virtual_symbol_prefix = '',
      ---Set virtual symbol suffix (defaults to ' ')
      virtual_symbol_suffix = ' ',
      ---Highlight named colors, e.g. 'green'
      enable_named_colors = false,
    })
  end,
}

