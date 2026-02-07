{ inputs, pkgs, ... }:{

  extraPackages = with pkgs; [ gopls ];
  extraConfig = ''
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "gomod", "gowork", "gotmpl" },
      callback = function()
        vim.lsp.start({
          name = "gopls",
          cmd = { "gopls" },
          root_dir = vim.fs.root(0, { "go.work", "go.mod", ".git" }),
        })
      end,
    })

    vim.lsp.config(
      "gopls", {
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      }
    )

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        vim.keymap.set("n", "<leader>gr", function()
          local file = vim.api.nvim_buf_get_name(0)
          local dir = vim.fn.fnamemodify(file, ":h")
          vim.cmd("split | terminal cd " .. dir .. " && go run " .. file)
        end, { buffer = true, desc = "Go run current file" }) -- <-- desc here
      end,
    })
  '';
}
