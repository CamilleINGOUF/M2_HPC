with import<nixpkgs> {};

stdenv.mkDerivation {

  name = "hpcMPI";

  buildInputs = [
    gcc
    gnuplot
    gnome3.eog
    imagemagick
    openmpi
  ];

}

