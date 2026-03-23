---@module 'lazy'
---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "main",
  config = function()
    local parsers = {
      "angular",
      "asm",
      "astro",
      "bash",
      "c",
      "c_sharp",
      "cmake",
      "cpp",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "editorconfig",
      "gitcommit",
      "git_config",
      "git_rebase",
      "go",
      "gpg",
      "graphql",
      "groq",
      "html",
      "http",
      "java",
      "jq",
      "jsdoc",
      "json",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "markdown_inline",
      "nginx",
      "objc",
      "perl",
      "php",
      "php_only",
      "phpdoc",
      "prisma",
      "python",
      "r",
      "regex",
      "ruby",
      "rust",
      "scss",
      "sql",
      "ssh_config",
      "svelte",
      "swift",
      "terraform",
      "tmux",
      "toml",
      "tsx",
      "typescript",
      "typst",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
      "zig",
      "zsh",
    }
    require("nvim-treesitter").install(parsers)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf, filetype = args.buf, args.match

        local language = vim.treesitter.language.get_lang(filetype)
        if not language then
          return
        end

        if not vim.treesitter.language.add(language) then
          return
        end
        vim.treesitter.start(buf, language)

        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
