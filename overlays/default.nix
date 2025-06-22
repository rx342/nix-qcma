final: prev: {
  ffmpeg =
    (prev.ffmpeg.override {
      withDoc = false;
      withManPages = false;
    }).overrideAttrs
      {
        version = "2.8.22";
        src = prev.fetchgit {
          url = "https://git.ffmpeg.org/ffmpeg.git";
          rev = "n${final.ffmpeg.version}";
          hash = "sha256-hdP2dvP/ndyOpZoi+UN3vo9Mpf4sn+ECvHBVtFSTJzk=";
        };
        doCheck = false;
        patches = [
          (prev.fetchpatch2 {
            name = "mathops.patch";
            url = "https://git.ffmpeg.org/gitweb/ffmpeg.git/patch/effadce6c756247ea8bae32dc13bb3e6f464f0eb";
            hash = "sha256-vLSltvZVMcQ0CnkU0A29x6fJSywE8/aU+Mp9os8DZYY=";
          })
        ];
        configureFlags =
          (builtins.filter (
            x:
            (
              !(builtins.elem x [
                "--enable-alsa"
                "--enable-amf"
                "--enable-libaom"
                "--disable-libaribb24"
                "--disable-libaribcaption"
                "--disable-chromaprint"
                "--disable-libcodec2"
                "--disable-cuda"
                "--enable-cuda-llvm"
                "--disable-cuda-nvcc"
                "--enable-cuvid"
                "--enable-libdav1d"
                "--enable-libdrm"
                "--disable-libdvdnav"
                "--disable-libdvdread"
                "--enable-ffnvcodec"
                "--enable-libharfbuzz"
                "--disable-libjack"
                "--disable-libjxl"
                "--disable-liblc3"
                "--disable-liblcevc-dec"
                "--disable-lcms2"
                "--disable-metal"
                "--disable-libmysofa"
                "--disable-libnpp"
                "--enable-nvdec"
                "--enable-libopenmpt"
                "--disable-libplacebo"
                "--disable-libqrencode"
                "--disable-libquirc"
                "--disable-librav1e"
                "--enable-librist"
                "--disable-librubberband"
                "--enable-sdl2"
                "--disable-libshaderc"
                "--enable-libsrt"
                "--disable-librsvg"
                "--enable-libsvtav1"
                "--disable-libtensorflow"
                "--enable-v4l2-m2m"
                "--disable-libvpl"
                "--disable-libvmaf"
                "--enable-vulkan"
                "--disable-libvvenc"
                "--disable-libxevd"
                "--disable-libxeve"
                "--enable-libxml2"
                "--enable-libzimg"
                "--disable-nonfree"
                "--enable-libopenjpeg"
                "--enable-nvenc"
              ])
            )
          ) (prev.ffmpeg.configureFlags or [ ]))
          ++ [
            "--disable-doc"
          ];
      };
}
