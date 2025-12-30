local M = {}

function M.setup()
  local set = vim.api.nvim_set_hl
  local p = require("mytheme.palette")

  require("mytheme.ui")(p, set)
  require("mytheme.syntax")(p, set)
  require("mytheme.treesitter")(p, set)
  require("mytheme.lsp")(p, set)
  require("mytheme.telescope")(p, set)
  require("mytheme.neotree")(p, set)
end

return M
