{
  description = "cabal2nixWithoutIFD";

  inputs.purenix.url = "github:purenix-org/purenix";
  # inputs.nixpkgs.follows = "purenix/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils, purenix }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlay = final: prev: {
          purescript = (prev.purescript.overrideAttrs ({ meta ? {}, ... }: {
            meta = meta // {
              platforms = prev.lib.platforms.darwin;
            };
          }));
        };
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            overlay
          ];
          config = {
            allowBroken = true;
            allowUnsupportedSystem = true;
          };
        };
        use-purenix-aarch64 = pkgs.stdenv.mkDerivation {
          name = "use-purenix-shell";
          nativeBuildInputs = [
            pkgs.purenix
            (pkgs.purescript.overrideAttrs ({ meta ? {}, ... }: {
              meta = meta // {
                platforms = pkgs.lib.platforms.darwin;
              };
            }))
            pkgs.spago
            pkgs.dhall-lsp-server
            pkgs.nodePackages.purty
            pkgs.nodePackages.purescript-psa
            pkgs.nixpkgs-fmt
            pkgs.bashInteractive # See: https://discourse.nixos.org/t/interactive-bash-with-nix-develop-flake/15486
          ];
          dontUnpack = true;
          installPhase = "touch $out";
        };

      in
      {
        devShell = use-purenix-aarch64;
      }
    );
}
