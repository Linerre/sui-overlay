pkgs:
let
  version = "1.38.3";
in
pkgs.stdenv.mkDerivation {
  name = "sui-testnet";
  inherit version;

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/testnet-v${version}/sui-testnet-v${version}-ubuntu-x86_64.tgz";
    sha256 = "sha256-SZspfOP9ywIL0QBKfuSL8HEtK88/XqtENrmuumykJbQ=";
  };

  installPhase = ''
    mkdir -p $out/bin
    for b in *; do
      if [ -f "$b" ] && [ -x "$b" ]; then
        cp "$b" $out/bin/
        chmod +x $out/bin/"$b"
      fi
    done
  '';
}
