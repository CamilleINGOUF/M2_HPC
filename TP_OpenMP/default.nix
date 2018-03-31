with import<nixpkgs> {};

stdenv.mkDerivation {

  name = "hpcOpenMP";

  src = ./.;

  buildInputs = [
    gcc
    gnome3.eog
    gnumake
  ];

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    mv *.out $out/bin
  '';

}
