{ inputs, pkgs, ... }:

let
  lib = inputs.nixpkgs.lib;
  go-lsp = import ./lsp/go.nix { inherit inputs pkgs; };
  nodejs-lsp = import ./lsp/nodejs.nix { inherit inputs pkgs; };
  all-lsps = [ go-lsp nodejs-lsp ];

  mergedExtraPackages = lib.concatMap (cfg: cfg.extraPackages) all-lsps;
  mergedLspConfig = lib.concatStringsSep "\n" (map (cfg: cfg.extraConfig) all-lsps);

  navigation-plugins = import ./plugins/navigation.nix { };
  editing-plugins = import ./plugins/editing.nix { };
  git-plugins = import ./plugins/git.nix { };
  languages-plugins = import ./plugins/languages.nix { };
  all-plugins = [ navigation-plugins editing-plugins git-plugins languages-plugins ];

  mergedPlugins = lib.concatStringsSep "\n" all-plugins;
in
{
  imports = [
    inputs.nvchad4nix.homeManagerModule
  ];

  programs = {
    neovim.defaultEditor = true;

    nvchad = {
      enable = true;
      extraPackages = with pkgs;
        mergedExtraPackages ++ [
          docker-compose-language-service
          dockerfile-language-server-nodejs
          nixd
          nodePackages.bash-language-server
          nodePackages.vscode-langservers-extracted
        ];
      hm-activation = true;
      extraConfig = ''
        local configs = require("nvchad.configs.lspconfig")
        local on_attach = configs.on_attach
        local capabilities = configs.capabilities

        ${mergedLspConfig}
      '';
      extraPlugins = ''
        return {
          ${mergedPlugins}
        }
      '';
    };
  };
}
