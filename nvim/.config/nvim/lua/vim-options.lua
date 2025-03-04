vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true

-- Indent left and right
local function indent_repeat(direction)
  local count = 1
  return function()
    local mode = vim.fn.visualmode()
    if mode == "v" or mode == "V" then -- Linewise or characterwise visual mode
      vim.cmd(direction .. count)
    elseif mode == "" then -- Visual block mode
      vim.cmd("normal! " .. direction .. count .. "gv") -- Indent and reselect the block
    else -- Normal mode
      vim.cmd(direction .. count)
    end
    count = count + 1
  end
end

vim.keymap.set("v", "<leader><", indent_repeat("<"), { desc = "Indent left" })
vim.keymap.set("v", "<leader>>", indent_repeat(">"), { desc = "Indent right" })

vim.keymap.set("n", "<leader><", indent_repeat("<"), { desc = "Indent left" })
vim.keymap.set("n", "<leader>>", indent_repeat(">"), { desc = "Indent right" })
