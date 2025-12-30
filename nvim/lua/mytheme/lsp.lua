return function(p, set)
  set(0, 'DiagnosticError', { fg = p.color1 })
  set(0, 'DiagnosticWarn', { fg = p.color3 })
  set(0, 'DiagnosticInfo', { fg = p.color2 })
  set(0, 'DiagnosticHint', { fg = p.color8 })

  set(0, '@lsp.type.class', { fg = p.color5 })
  set(0, '@lsp.type.function', { fg = p.color4 })
  set(0, '@lsp.type.property', { fg = p.color6 })
end
