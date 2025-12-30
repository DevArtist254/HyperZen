return {
  "nvim-treesitter/nvim-treesitter",
  bulid= ":TSupdate",
  config= function()
    -- treesitter
    local config = require("nvim-treesitter.configs")

    config.setup({
      ensure_installed = { "lua", "javascript" },
      hightlight = { enable = true },
      indent = { enable = true },
    })
  end
}
