vim.lsp.config["typos_lsp"] = LSP_MERGE({
  cmd = { "typos-lsp" },
  filetypes = { "*" },
  root_markers = { ".git" },
}, { capabilities = LSP_CAPS })

vim.lsp.start(vim.lsp.config["typos_lsp"])