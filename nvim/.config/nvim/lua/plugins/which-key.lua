return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
    spec = {
      { "<leader>b", group = "Buffers" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Toggle" },
      { "<leader>c", group = "Code"  },
      { "<leader>g", group = "Plugins"  },
      { "<leader>f", group = "Find"  },
    },
  },
}

