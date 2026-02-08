{ }:

''
  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle", 
      "MarkdownPreview",
      "MarkdownPreviewStop"
    },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    keys = {
      { "<leader-mp>", "<cmd><C-U>MarkdownPreview<cr>", desc = "MarkdownPreview" },
      { "<leader-mps>", "<cmd><C-U>MarkdownPreviewStop<cr>", desc = "MarkdownPreviewStop" },
      { "<leader-mpt>", "<cmd><C-U>MarkdownPreviewToggle<cr>", desc = "MarkdownPreviewToggle" },
    }
  },
  {
    "julienvincent/hunk.nvim",
    cmd = { "DiffEditor" },
    config = function()
      require("hunk").setup()
    end,
  },
  {
    'lucidph3nx/nvim-sops',
    event = { 'BufEnter' },
    opts = { }
  },
''
