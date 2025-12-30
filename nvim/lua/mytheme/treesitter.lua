return function(p, set)
  set(0, '@string', { fg = p.color2 })
  set(0, '@comment', { fg = p.color8, italic = true })
  set(0, '@function', { fg = p.color4 })
  set(0, '@keyword', { fg = p.color1 })
  set(0, '@variable', { fg = p.color7 })
  set(0, '@field', { fg = p.color6 })
  set(0, '@type', { fg = p.color5 })
end
