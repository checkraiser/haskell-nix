{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, attoparsec, base, blaze, digestive-functors
      , either, esqueleto, persistent, servant, servant-server, stdenv
      , transformers, wai, wai-extra, warp, wreq
      }:
      mkDerivation {
        pname = "rewordify";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [
          attoparsec base blaze digestive-functors either esqueleto
          persistent servant servant-server transformers wai wai-extra warp
          wreq
        ];
        description = "Test";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
