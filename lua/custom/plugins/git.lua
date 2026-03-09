---@module 'lazy'
---@type LazySpec
return {
  {
    "tpope/vim-fugitive",
    dependencies = "tpope/vim-rhubarb",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "<leader>G", "<cmd>Git<CR>")
      vim.keymap.set("n", "<leader>ga", "<cmd>Git add %:p<CR>")
      vim.keymap.set("n", "<leader>gt", "<cmd>Git commit -v -q %:p<CR>")
      vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiff HEAD<CR>")
      vim.keymap.set("n", "<leader>gc", "<cmd>G checkout -<CR>")
      vim.keymap.set("n", "<leader>gC", "<cmd>G checkout master<CR>")
      vim.keymap.set("n", "<leader>gb", ":G checkout -b ")
      vim.keymap.set("n", "<leader>gl", "<cmd>Git pull<CR>")
      vim.keymap.set("n", "<leader>gp", "<cmd>Git push origin HEAD<CR>")
      vim.keymap.set("n", "<leader>gP", "<cmd>Git push origin HEAD --force<CR>")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    ---@module 'gitsigns'
    ---@type Gitsigns.config
    opts = {
      on_attach = function()
        local gitsigns = require "gitsigns"

        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal { "]c", bang = true }
          else
            gitsigns.nav_hunk "next"
          end
        end, { desc = "Jump to next git [c]hange" })

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal { "[c", bang = true }
          else
            gitsigns.nav_hunk "prev"
          end
        end, { desc = "Jump to previous git [c]hange" })

        vim.keymap.set("v", "<leader>hs", function()
          gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "stage git hunk" })
        vim.keymap.set("v", "<leader>hr", function()
          gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, { desc = "reset git hunk" })

        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
        vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
        vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
        vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
        vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
        vim.keymap.set("n", "<leader>hD", function()
          gitsigns.diffthis "@"
        end, { desc = "git [D]iff against last commit" })

        vim.keymap.set(
          "n",
          "<leader>tb",
          gitsigns.toggle_current_line_blame,
          { desc = "[t]oggle git show [b]lame line" }
        )
        vim.keymap.set("n", "<leader>td", gitsigns.preview_hunk_inline, { desc = "[t]oggle git show [d]eleted" })
      end,
    },
  },
}
