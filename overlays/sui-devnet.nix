pkgs:
let
  version = "1.39.0";
in
pkgs.stdenv.mkDerivation {
  name = "sui-devnet";
  inherit version;

  src = pkgs.fetchzip {
    stripRoot = false;
    url = "https://github.com/MystenLabs/sui/releases/download/devnet-v${version}/sui-devnet-v${version}-ubuntu-x86_64.tgz";
    sha256 = "sha256-NjrdSGHF9mk7a8Dc6jHsv7qPMZORwDupFghMOnazo9c=";
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
