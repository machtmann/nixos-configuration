{ inputs, pkgs, ...}:
{
  imports = [
    ./packages
  ];

  home.sessionVariables = {
    CONTAINER_RUNTIME = "containerd";
    DIRENV_LOG_FORMAT = "";
    DRIVER = "podman";
    EDITOR = "nvim";
    WINIT_UNIX_BACKEND = "wayland";
  };

  programs = {
    eza.enable = true;
    direnv.enable = true;
  };

  home.stateVersion = "25.11";
}
