{ stdenv, fetchurl }:

let
  version = "3.2.0";
in
stdenv.mkDerivation {
  pname = "nvtop";
  inherit version;

  src = fetchurl {
    url = "https://github.com/Syllo/nvtop/releases/download/${version}/nvtop-${version}-x86_64.AppImage";
    sha256 = "sha256-M8VPtwJfQ6IT246YMIhg1ADbM0mmH8k4L+RzbH0lgMQ="; # Replace with actual hash
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/nvtop
    chmod +x $out/bin/nvtop
  '';
}

