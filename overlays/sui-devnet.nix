pkgs:
let
  version = "1.38.0";
in
pkgs.stdenv.mkDerivation {
  name = "sui-devnet";
  inherit version;

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v${version}/sui-devnet-v${version}-ubuntu-x86_64.tgz";
    sha256 = "sha256-e1UdDxR5HnPlQ9d7r0d164Pd8EmUPJYooUwC1M/f0dA=";
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
