return {
	"numToStr/Comment.nvim",
	lazy = false, -- or true to lazy load on require if desired.
  config = function()
		require('Comment').setup()
	end,
}
