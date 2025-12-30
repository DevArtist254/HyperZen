vim.lsp.config["css_variables"] = LSP_MERGE({
  cmd = { "css-variables-language-server", "--stdio" },
  filetypes = { "css", "scss" },
  root_markers = { ".git" },
}, { capabilities = LSP_CAPS })

vim.lsp.start(vim.lsp.config["css_variables"])