with import<nixpkgs> {};

stdenv.mkDerivation {

  name = "hpcThreads";

  buildInputs = [
    gcc
    gnuplot
    gnome3.eog
    imagemagick
  ];

}

