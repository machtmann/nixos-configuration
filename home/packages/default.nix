{ lib, ... }: {
  imports = [
    ./neovim.nix
    ./scm.nix
    ./shell.nix
    ./tmux.nix
  ];
}
