{ enableSystemd ? true }:
(import ./nixpkgs.nix {
  crossSystem = {
    config = "powerpc64le-unknown-linux-gnu";
  };
  overlays = [ (import ./overlay.nix) ];
}).callPackage ./derivation.nix
{
  enableCriu = false;
  enableSystemd = enableSystemd;
}
