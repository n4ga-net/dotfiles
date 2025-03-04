return {
	"gbprod/nord.nvim",
	name = "nord",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("nord") -- set the theme
	end,
}
