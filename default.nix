let
  pkgs = import <nixpkgs> {};
  local-typst-env = pkgs.callPackage (
    pkgs.fetchFromGitHub {
      owner = "xieby1";
      repo = "local-typst-env";
      rev = "a2ef3c7d352e31535db73513a85f4f4a45b474ea";
      hash = "sha256-wRJ0VhqgWz1FpHCpKyUY8KH8NarvNHZyAAs2AOR/HNE=";
    }
  ) {};
in local-typst-env {
  src = ./.; # TODO: nix ignore
}
