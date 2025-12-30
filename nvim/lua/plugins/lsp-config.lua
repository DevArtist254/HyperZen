return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        automatic_enable = { "lua_ls", "ts_ls", "cssls", "css_var", "emmet_ls", "pyright", "typos_lsp" }
      }
    end
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  }
}
