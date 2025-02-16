return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- if going to manage linter, do it through :Mason
      }
    })
  end
}
