{ inputs, pkgs, ... }:{
  home.packages = with pkgs;[
    inputs.quickshell.packages.x86_64-linux.default
    fish
    jq
    fd
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [
      aubio
      pyaudio
      numpy
    ]))
    cava
    bluez
    ddcutil
    brightnessctl
    curl
    material-symbols
  ];
}
