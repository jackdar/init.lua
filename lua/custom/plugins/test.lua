return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    "nvim-neotest/neotest-jest",
    "olimorris/neotest-phpunit",
  },
  event = "BufReadPost",
  config = function()
    local neotest = require "neotest"

    ---@diagnostic disable-next-line: missing-fields
    neotest.setup {
      adapters = {
        require "neotest-vitest",
        require "neotest-jest" {
          jestCommand = "npm test --",
          jestArguments = function(defaultArguments, context)
            return defaultArguments
          end,
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
          isTestFile = require("neotest-jest.jest-util").defaultIsTestFile,
        },
        require "neotest-phpunit",
      },
    }

    vim.keymap.set("n", "<leader>tr", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand "%")
    end, { desc = "Run tests in current file" })

    vim.keymap.set("n", "<leader>ta", function()
      neotest.run.attach()
    end, { desc = "Attach to the nearest test" })

    vim.keymap.set("n", "<leader>tp", function()
      neotest.output_panel.toggle()
    end, { desc = "Toggle the test output panel" })
  end,
}
