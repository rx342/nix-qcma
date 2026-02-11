{
  system ? builtins.currentSystem,
  source ? import ./npins,
  pkgs ? import source.nixpkgs {
    overlays = [ (import ./overlays/default.nix) ];
    config = { };
    inherit system;
  },
  qcma ? source.qcma,
  nix-vitamtp ? import source.nix-vitamtp { },
}:

let
  inherit (pkgs) lib;
in
lib.makeScope pkgs.newScope (final: {
  qcma = final.callPackage ./qcma.nix {
    inherit qcma;
    inherit (nix-vitamtp) libvitamtp;
  };
  test = final.callPackage ./test.nix {
    inherit (source) nix-vitamtp;
  };
})
