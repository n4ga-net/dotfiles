return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", function()
        builtin.find_files({
          hidden = true,          -- <-- descend into .config, etc
          follow = false,          -- (optional) follow symlinks
          no_ignore = true,       -- (optional) ignore .gitignore/.ignore
          no_ignore_parent = true -- (optional) also ignore parent ignore files
        })
      end, { desc = "Find Files (repo incl. hidden)" })

      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({
          additional_args = function()
            return {
              "--hidden",          -- grep inside hidden dirs
              "--glob", "!.git/*", -- don’t spam .git
            }
          end,
        })
      end, { desc = "Grep (repo incl. hidden)" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
