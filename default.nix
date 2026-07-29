{
  npinsed ? import ./npins,
  pkgs ? import npinsed.nixpkgs {},
  buildLocalTypstEnv ? pkgs.callPackage npinsed.local-typst-env.outPath {},
  inNixShell ? false,
}: buildLocalTypstEnv {
  src = pkgs.nix-gitignore.gitignoreSource [] ./.;
  nativeBuildInputs = pkgs.lib.optionals inNixShell [
    # for tests
    pkgs.poppler-utils
    (let src = pkgs.fetchurl {
      url = "https://github.com/xieby1/nestoc/raw/b893af13e082caae5073c16605625f4cb86e6634/doc/check_regex_order.py";
      sha256 = "1kf7p3yba100i3ir7zs2cgpivrr2369mkckcpas5n8z64pxgf2jh";
    }; in pkgs.writeScriptBin src.name "${pkgs.python3}/bin/python3 ${src} $@")
  ];
}
