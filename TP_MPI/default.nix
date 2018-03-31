with import<nixpkgs> {};

stdenv.mkDerivation {

  name = "hpcMPI";

  src = ./.;

  buildInputs = [
    gcc
    gnuplot
    gnome3.eog
    openmpi
  ];

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    mv *.out $out/bin
    cp *.sh $out/bin
  '';
}
