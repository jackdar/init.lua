---@module 'lazy'
---@type LazySpec
return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.tbl_extend("force", opts.ensure_installed, { "http", "graphql" })
    end,
  },
  config = function()
    vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>")
    vim.keymap.set("n", "<leader>rl", "<cmd>Rest last<CR>")
  end,
}
