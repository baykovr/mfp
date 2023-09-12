{ pkgs ? import <nixpkgs> {system = builtins.currentSystem;}
, lib ? pkgs.lib
, stdenv ? pkgs.fetchurl
, fetchFromGitHub ? pkgs.fetchFromGitHub
, rustPlatform ? pkgs.rustPlatform
, Security ? pkgs.Security
, openssl ? pkgs.openssl
, alsa-lib ? pkgs.alsa-lib
}:

rustPlatform.buildRustPackage rec {
  pname = "mfp";
  version = "a4747db7e860bbec6836ac0b8d136045f01c2f8c";
  
  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  src = ./.;

  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.alsa-lib ] ;

  PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

  cargoHash = "sha256-ALqFOlQ0Pw+fz4tkk/c+iW4vB0yZssaaj16IY3mSrUg=";
}
