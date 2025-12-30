local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

-- Deep merge helper
local function merge(a, b)
  for k, v in pairs(b) do
    if type(v) == "table" and type(a[k] or false) == "table" then
      merge(a[k], v)
    else
      a[k] = v
    end
  end
  return a
end

_G.LSP_MERGE = merge
_G.LSP_CAPS = cmp_caps
