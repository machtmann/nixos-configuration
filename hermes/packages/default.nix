{ lib, ... }: {
  imports = [
    ./firefox.nix
    ./freetube.nix
    ./mangohud.nix
    ./obsidian.nix
    ./quickshell.nix
  ];
}
