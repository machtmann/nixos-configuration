{ inputs, pkgs, ... }:
{

  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  programs = {
    neovim.defaultEditor = true;

    nvchad = {
      enable = true;
      extraPackages = with pkgs; [
        docker-compose-language-service
        dockerfile-language-server-nodejs
        nixd
        nodePackages.bash-language-server
      ];
      hm-activation = true;
      extraPlugins = ''
        return {
          {
            "christoomey/vim-tmux-navigator",
            cmd = {
              "TmuxNavigateLeft",
              "TmuxNavigateDown",
              "TmuxNavigateUp",
              "TmuxNavigateRight",
              "TmuxNavigatePreviois",
              "TmuxNavigateProcessList",
            },
            keys = {
              { "<c-h>", "<cmd><C-U>TmuxNaviateLeft<cr>" },
              { "<c-j>", "<cmd><C-U>TmuxNaviateDown<cr>" },
              { "<c-k>", "<cmd><C-U>TmuxNaviateUp<cr>" },
              { "<c-l>", "<cmd><C-U>TmuxNaviateRight<cr>" },
              { "<c-\\>", "<cmd><C-U>TmuxNaviatePrevious<cr>" },
            }
          },
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
            "kdheepak/lazygit.nvim",
            lazy = true,
            cmd = {
              "LazyGit",
              "LazyGitConfig",
              "LazyGitCurrentFile",
              "LazyGitFilter",
              "LazyGitFilterCurrentFile",
            },
            dependencies = {
              "nvim-lua/plenary.nvim",
            },
            keys = {
              { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
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
          {
            "f-person/git-blame.nvim",
            event = "VeryLazy",
            opts = {
              enabled = true,
              message_template = " <summary> • <date> • <author> • <<sha>>",
              date_format = "%m-%d-%Y %H:%M:%S",
              virtual_text_column = 1,
            }
          },
          {
            'mrcjkb/rustaceanvim',
            version = '^6',
            lazy = false,
          }
        }
      '';
    };
  };
}
