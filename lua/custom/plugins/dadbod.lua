---@module 'lazy'
---@type LazySpec
return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    {
      "nvim-treesitter/nvim-treesitter",
      config = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.tbl_extend("force", opts.ensure_installed, { "sql" })
      end,
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
