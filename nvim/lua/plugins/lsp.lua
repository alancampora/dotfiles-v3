return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "ast_grep", "astro" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = { { 'hrsh7th/cmp-nvim-lsp' } },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config("tsserver", {
        capabilities = capabilities,
      })

      vim.lsp.config("solargraph", {
        capabilities = capabilities,
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("ast_grep", {
        capabilities = capabilities,
      })

      vim.lsp.config("astro", {
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "tsserver",
        "solargraph",
        "html",
        "lua_ls",
        "ast_grep",
        "astro",
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>ge", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
      vim.keymap.set("n", "<leader>ck", vim.diagnostic.open_float, { desc = "Show diagnostics" })


      vim.diagnostic.config({
        virtual_text = false, -- Disable inline diagnostics
        signs = true,         -- Show signs in the sign column
        underline = true,     -- Underline issues in the code
        severity_sort = true, -- Sort diagnostics by severity
        float = {
          source = "always",  -- Show diagnostic source in the float
          border = "rounded", -- Rounded border for floating windows
        },
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          vim.diagnostic.open_float(nil, { focus = false })
        end,
      })
    end,
  },
}
