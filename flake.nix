{
  description = "Development environment for Python applications.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
  in
  rec {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        python311
        poetry
      ] ++ (with python311Packages; [
        pip
        flet
      ]);

      NIX_LD_LIBRARY_PATH = with pkgs; nixpkgs.lib.makeLibraryPath [
        alsa-lib
        at-spi2-atk
        at-spi2-core
        atk
        cairo
        cups
        curl
        dbus
        expat
        fontconfig
        freetype
        fuse3
        gdk-pixbuf
        glib
        gst_all_1.gst-libav
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-vaapi
        gst_all_1.gstreamer
        gtk3
        harfbuzz
        icu
        libGL
        libappindicator-gtk3
        libdrm
        libepoxy
        libglvnd
        libnotify
        libpulseaudio
        libunwind
        libusb1
        libuuid
        libxkbcommon
        libxml2
        mesa
        nspr
        nss
        openssl
        pango
        pipewire
        stdenv.cc.cc
        systemd
        vulkan-loader
        xorg.libX11
        xorg.libXScrnSaver
        xorg.libXcomposite
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXi
        xorg.libXrandr
        xorg.libXrender
        xorg.libXtst
        xorg.libxcb
        xorg.libxkbfile
        xorg.libxshmfence
        zlib
      ];

      NIX_LD = nixpkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
    };
  };
}

