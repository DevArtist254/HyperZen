return function(p, set)
  set(0, 'NeoTreeNormal', { bg = p.color0, fg = p.foreground })
  set(0, 'NeoTreeDirectoryName', { fg = p.color4 })
  set(0, 'NeoTreeGitAdded', { fg = p.color2 })
  set(0, 'NeoTreeGitModified', { fg = p.color4 })
  set(0, 'NeoTreeGitDeleted', { fg = p.color1 })
end
