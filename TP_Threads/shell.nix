with import<nixpkgs> {};

stdenv.mkDerivation {

  name = "hpc-threads";

  buildInputs = [
    gcc
    gnuplot
    evince
    gnome3.eog
    imagemagick
    pkgconfig
  ];

}

