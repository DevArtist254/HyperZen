return function(p, set)
  set(0, 'Normal', { fg = p.foreground, bg = p.background })
  set(0, 'CursorLine', { bg = p.color0 })
  set(0, 'LineNr', { fg = p.color8 })
  set(0, 'CursorLineNr', { fg = p.color3, bold = true })
  set(0, 'Visual', { fg = p.selection_foreground, bg = p.selection_background })

  set(0, 'NormalFloat', { bg = p.color0 })
  set(0, 'FloatBorder', { fg = p.color4 })
end
