vim.lsp.config["ts_ls"] = LSP_MERGE({
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_markers = { { "tsconfig.json", "package.json" }, ".git" },
}, { capabilities = LSP_CAPS })

vim.lsp.start(vim.lsp.config["ts_ls"])