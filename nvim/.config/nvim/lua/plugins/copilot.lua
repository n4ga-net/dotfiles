return {
  "github/copilot.vim",
  config = function()
    -- disable Copilot's default <Tab> mapping
    vim.g.copilot_no_tab_map = true
    -- map <C-a> to accept Copilot suggestion
    vim.keymap.set("i", "<C-a>", 'copilot#Accept("<CR>")', {
      silent = true,
      expr = true,
      replace_keycodes = false,
    })
  end,
}
