{ mkDerivation, attoparsec, base, blaze, digestive-functors, either
, esqueleto, persistent, servant, servant-server, stdenv
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
}
