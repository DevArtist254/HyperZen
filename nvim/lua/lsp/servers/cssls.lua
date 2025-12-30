vim.lsp.config["cssls"] = LSP_MERGE({
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { ".git", "package.json" },
}, { capabilities = LSP_CAPS })

vim.lsp.start(vim.lsp.config["cssls"])

