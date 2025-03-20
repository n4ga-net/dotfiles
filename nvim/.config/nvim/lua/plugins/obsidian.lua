return {
	"epwalsh/obsidian.nvim",
	version = "*",
	-- Removing tag to just load in markdown to always have osbidian commands available, setting lazy to false to always load
  lazy = false,
	  -- ft = "markdown",
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
    templates = {
      folder = "~/obsidian/Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    },
	},
}
