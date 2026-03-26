let
  pkgs = import <nixpkgs> {};
  local-typst-env = pkgs.callPackage (
    pkgs.fetchFromGitHub {
      owner = "xieby1";
      repo = "local-typst-env";
      rev = "a914fcd702e3c0097acc9974100ab2e9a2d968a9";
      hash = "sha256-sF4dViV0o4Mgupl/akmKaWdr5qV8KToPm46II1xk8C8=";
    }
  ) {};
in local-typst-env {
  src = pkgs.nix-gitignore.gitignoreSource [] ./.;
}
