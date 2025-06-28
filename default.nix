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

pkgs.callPackage ./qcma.nix {
  inherit qcma;
  inherit (nix-vitamtp) libvitamtp;
}
