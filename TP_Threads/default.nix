with import<nixpkgs> {};

stdenv.mkDerivation {

  name = "hpcThreads";

  src = ./.;

  buildInputs = [
    gcc
    gnumake
    gnuplot
    gnome3.eog
  ];

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    mv *.out $out/bin
    cp *.sh $out/bin
  '';

}
