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
  check_regex_order-py = pkgs.runCommand "check_regex_order.py" {} ''
    mkdir -p $out/bin/
    ln -s
  '';
  miao = pkgs.writeScriptBin;
in local-typst-env {
  src = pkgs.nix-gitignore.gitignoreSource [] ./.;
  nativeBuildInputs = [
    # for tests
    pkgs.poppler-utils
    (let src = pkgs.fetchurl {
      url = "https://github.com/xieby1/nestoc/raw/b893af13e082caae5073c16605625f4cb86e6634/doc/check_regex_order.py";
      sha256 = "1kf7p3yba100i3ir7zs2cgpivrr2369mkckcpas5n8z64pxgf2jh";
    }; in pkgs.writeScriptBin src.name "${pkgs.python3}/bin/python3 ${src} $@")
  ];
}
