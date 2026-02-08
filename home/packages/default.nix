{ lib, ... }: {
  imports = [
    ./nvim
    ./scm.nix
    ./shell.nix
    ./tmux.nix
  ];
}
