with import<nixpkgs> {};

let
  _opencv3 = opencv3.override { 
    enableGtk3 = true;
    enableFfmpeg = true;
    enableIpp = true;
  };
in

stdenv.mkDerivation {

  name = "hpcOpenCL";

  buildInputs = [
    opencl-icd
    opencl-clhpp
    opencl-headers
    opencl-info

    _opencv3
    gcc
    gnuplot
    gnome3.eog
    gnome3.gtkmm
    imagemagick
    pkgconfig
  ];

}

