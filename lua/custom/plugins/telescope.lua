---@module 'lazy'
---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "natecraddock/telescope-zf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("telescope").setup {
      defaults = {
        mappings = {
          i = {
            ["<c-enter>"] = "to_fuzzy_refine",
            ["<esc>"] = require("telescope.actions").close,
          },
        },
      },
      layout_strategy = "flex",
      path_display = { "truncate" },
      pickers = {
        live_grep = {
          additional_args = { "--hidden" },
        },
      },
      extensions = {
        wrap_results = true,
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {},
        },
      },
    }

    -- pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "zf-native")
    pcall(require("telescope").load_extension, "ui-select")

    local builtin = require "telescope.builtin"
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
    vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
    vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
    vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [C]olorscheme" })
    vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
      callback = function(event)
        local buf = event.buf

        vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })
        vim.keymap.set("n", "gi", builtin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })
        vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })
        vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })
        vim.keymap.set(
          "n",
          "gW",
          builtin.lsp_dynamic_workspace_symbols,
          { buffer = buf, desc = "Open Workspace Symbols" }
        )
        vim.keymap.set("n", "gD", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
      end,
    })

    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
        winblend = 10,
        results_title = true,
        previewer = false,
      })
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<leader>f/", function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      }
    end, { desc = "[F]ind [/] in Open Files" })

    vim.keymap.set("n", "<leader>fn", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "[F]ind [N]eovim files" })
  end,
}
