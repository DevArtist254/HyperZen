vim.lsp.config["lua_ls"] = LSP_MERGE({
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
    }
  }
}, { capabilities = LSP_CAPS })

vim.lsp.start(vim.lsp.config["lua_ls"])