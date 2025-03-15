return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/obsidian",
			},
		},
		syntax = {
			conceal = true, -- Enable conceal by default
		},
    ui = {
      enable = false
    },
	},
}
