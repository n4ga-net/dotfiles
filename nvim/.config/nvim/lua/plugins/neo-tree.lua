return {
	"nvim-neo-tree/neo-tree.nvim",


	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  opts ={
    filesystem = {
      filtered_items = {
        visible = true,
        hide_gitignore = false,
        hide_dotfiles = false,
      },
    },
  },
  config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal toggle float<CR>", {})
	end,
}
