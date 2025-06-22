{
  stdenv,
  ffmpeg,
  libsForQt5,
  libnotify,
  libvitamtp,
  pkg-config,
  qcma,
}:

stdenv.mkDerivation {
  pname = "qcma";
  version = "0.4.1";
  src = qcma;
  env = {
    PKG_CONFIG_PATH = "${libvitamtp}/lib/pkgconfig:$PKG_CONFIG_PATH";
  };
  nativeBuildInputs = [
    libsForQt5.qt5.qttools
    libsForQt5.qt5.wrapQtAppsHook
    libnotify
    libvitamtp
    ffmpeg
    pkg-config
  ];
  buildPhase = ''
    mkdir -p build
    cd build
    lrelease-pro ../qcma.pro
    qmake ../qcma.pro PREFIX=$out
    make
  '';
  installPhase = ''
    make install
  '';
}
