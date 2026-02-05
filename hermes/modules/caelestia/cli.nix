{ pkgs, lib, python3Packages, fetchgit }:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "caelestia-cli";
  version = "0.1.0";

  src = fetchgit {
    url = "https://github.com/caelestia-dots/cli.git";
    rev = "4b666a797e5f0365aef75bbc28ee9bb83378450e"; # use an exact commit
    sha256 =
      "60GdtCjNtwRCHnIlRak3Hl6hJQPtINoS7g5bb5e60P4="; # get this via `nix-prefetch-git`
  };
  format = "pyproject";

  buildInputs = with python3Packages; [
    hatchling
    hatch-vcs

  ];

  propagatedBuildInputs = with python3Packages; [
    click
    requests
    materialyoucolor
    pillow
  ];

  postInstall = ''
    install -D -m644 completions/caelestia.fish \
      $out/share/fish/vendor_completions.d/caelestia.fish
  '';

  doCheck = false; # disable if no tests
}
