 { pkgs ? (import <nixpkgs> { config = import ./config.nix; }) }:

 with pkgs;

let

  _stdenv = overrideCC stdenv gcc5;

  myopencv3 = callPackage ./myopencv3.nix { stdenv = _stdenv; };

  _opencv3 = myopencv3.override {
    stdenv = _stdenv;

    enableGtk3 = true;
    enableFfmpeg = true;
    enableOpenblas = true;
    enableCuda = true;

    enableWebP = false;
    enableEXR = false;
    enableJPEG2K = false;
    enableEigen = false;
  };

in

_stdenv.mkDerivation {

  name = "hpcOpenCV";

  src = ./.;

  buildInputs = [
    boost
    ffmpeg
    gnumake
    pkgconfig
    gnome3.gtkmm
    opencl-icd
    opencl-info
    zlib
    _opencv3
  ];

  enableParallelBuilding = true;

  installPhase = ''
    mkdir -p $out/bin
    mv *.out $out/bin
  '';

}
