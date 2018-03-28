with import<nixpkgs> {};

stdenv.mkDerivation {

  name = "hpcOpenMP";

  buildInputs = [
    gcc
    gnuplot
    gnome3.eog
    imagemagick
  ];

}

