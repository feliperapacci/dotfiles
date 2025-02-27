return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.keymap.set("n", "<leader>md", vim.cmd.MarkdownPreviewToggle)
    end,
    ft = { "markdown" },
  }, --markdown viewer

  {
    'tribela/transparent.nvim',
    config = false,
    auto = false,
  },

  {'rstacruz/vim-closer'}, -- closes brackets
}

