{ inputs, pkgs, ... }: {

  extraPackages = with pkgs; [
    typescript-language-server
    svelte-language-server
  ];

  extraConfig = ''
    vim.lsp.config(
      "ts_ls", {
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "all" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            },
          },
        },
      }
    )

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
      callback = function()
        vim.lsp.start({
          name = "ts_ls",
          cmd = { "typescript-language-server", "--stdio" },
          root_dir = vim.fs.root(0, { "tsconfig.json", "package.json", ".git" }),
        })
      end,
    })

    vim.lsp.config(
      "svelte", {
        capabilities = capabilities,
      }
    )

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "svelte",
      callback = function()
        vim.lsp.start({
          name = "svelte",
          cmd = { "svelteserver", "--stdio" },
          root_dir = vim.fs.root(0, { "package.json", ".git" }),
        })
      end,
    })
  '';
}
