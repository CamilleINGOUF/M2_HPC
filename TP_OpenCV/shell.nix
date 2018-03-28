with import<nixpkgs> {};

let
  _opencv3 = opencv3.override { 
    enableGtk3 = true;
    enableFfmpeg = true;
    enableIpp = true;
  };

    _opencv3_att = _opencv3.overrideDerivation (attrs: {
        cmakeFlags = [attrs.cmakeFlags "-DENABLE_PRECOMPILED_HEADERS=OFF"];
    });
in

stdenv.mkDerivation {

  name = "hpcThreads";

  buildInputs = [
    boost
    ffmpeg
    gcc
    gnuplot
    gnome3.eog
    gnome3.gtkmm
    imagemagick
    _opencv3
    pkgconfig
    vlc
    zlib
  ];

}

