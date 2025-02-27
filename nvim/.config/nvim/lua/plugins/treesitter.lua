return{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "cpp", "java", "python", "javascript", "html", "css", "bash", "c", "lua", "query", "markdown", "markdown_inline" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
    -- keybind
    vim.keymap.set("n", "<leader>ts", vim.cmd.InspectTree)
  end
}
