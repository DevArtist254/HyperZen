return function(p, set)
  set(0, 'TelescopeNormal', { bg = p.color0, fg = p.foreground })
  set(0, 'TelescopeBorder', { bg = p.color0, fg = p.color4 })
  set(0, 'TelescopeSelection', { bg = p.selection_background, fg = p.selection_foreground })
  set(0, 'TelescopePromptPrefix', { fg = p.color1 })
end
