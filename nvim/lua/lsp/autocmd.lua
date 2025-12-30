vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Unset 'formatexpr'
    vim.bo[args.buf].formatexpr = nil
    -- Unset 'omnifunc'
    vim.bo[args.buf].omnifunc = nil
    -- Unmap K
    vim.keymap.del('n', 'K', { buffer = args.buf })

    -- Keymaps
    vim.keymap.set("n", "gH", vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set("n", "gD", vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set({ "n", "v" }, "ca", vim.lsp.buf.code_action, { buffer = args.buf })

    -- Rename
    vim.keymap.set({ "n", "v" }, "gR", vim.lsp.buf.rename, {
      buffer = args.buf,
      desc = "Rename symbol",
    })

    -- Implementation
    if client:supports_method("textDocument/implementation") then
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = args.buf })
    end

    -- Autocompletion
    --  if client:supports_method("textDocument/completion") then
    --  vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = false })
    -- end

    -- Format on save
    if client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp.format", { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 800 })
        end,
      })
    end

    -- Format on paste
    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
      group = vim.api.nvim_create_augroup("my.lsp.format_paste", { clear = false }),
      buffer = args.buf,
      callback = function()
        if vim.v.event and vim.v.event.operator == "p" then
          vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 500 })
        end
      end,
    })
  end,
})
