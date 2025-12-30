vim.lsp.config["emmet_ls"] = LSP_MERGE({
  cmd = { "emmet-ls", "--stdio" },
  filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
  root_markers = { ".git" },
}, { capabilities = LSP_CAPS })

vim.lsp.start(vim.lsp.config["emmet_ls"])