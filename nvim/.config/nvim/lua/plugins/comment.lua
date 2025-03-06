return {
	"numToStr/Comment.nvim",
	lazy = false, -- or true to lazy load on require if desired.
	config = function()
		vim.keymap.set( "n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle comment linewise" })
	end,
}
