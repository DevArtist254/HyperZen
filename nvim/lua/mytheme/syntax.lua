return function(p, set)
  set(0, 'Comment', { fg = p.color8, italic = true })
  set(0, 'String', { fg = p.color2 })
  set(0, 'Function', { fg = p.color4 })
  set(0, 'Identifier', { fg = p.color1 })
  set(0, 'Keyword', { fg = p.color1 })
end
