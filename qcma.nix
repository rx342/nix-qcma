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
  version = "0.5.1";
  src = qcma;
  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    libsForQt5.qt5.qttools
    libsForQt5.qt5.wrapQtAppsHook
    libnotify
    libvitamtp
    ffmpeg
  ];
  patchPhase = ''
    substituteInPlace common/cmabroadcast.cpp \
      --replace-fail ".toStdString()" ".toUtf8()"
    substituteInPlace cli/main_cli.cpp \
      --replace-fail "QLibraryInfo::path(QLibraryInfo::TranslationsPath)" \
                "QLibraryInfo::location(QLibraryInfo::TranslationsPath)"
    substituteInPlace gui/main.cpp \
      --replace-fail "QLibraryInfo::path(QLibraryInfo::TranslationsPath)" \
                "QLibraryInfo::location(QLibraryInfo::TranslationsPath)"
    substituteInPlace gui/forms/backupitem.cpp \
      --replace-fail "return ui->itemPicture->pixmap();" \
                "return ui->itemPicture->pixmap() ? *ui->itemPicture->pixmap() : QPixmap();"
  '';
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
