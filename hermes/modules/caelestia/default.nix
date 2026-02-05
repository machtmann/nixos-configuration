{ lib, pkgs, ... }: {
  imports = lib.filesystem.listFilesRecursive ./.;
}
