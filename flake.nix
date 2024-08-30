{
  description = "A cross-platform CLI clipboard management utils, written in POSIX shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: let
    forAllSystems = nixpkgs.lib.genAttrs systems;
    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (pkgs) lib;
    in {
      default = self.packages.${system}.clip;
      clip = pkgs.stdenv.mkDerivation {
        name = "clip";
        pname = "clip";
        src = ./.;

        nativeBuildInputs = with pkgs; [ makeWrapper ];

        installPhase = ''
          mkdir -p $out/bin
          install -t $out/bin -m 755 yank put
        '';

        postFixup = with pkgs; ''
          for bin in $out/bin/*; do
            wrapProgram $bin \
              --set PATH ${lib.makeBinPath [
                coreutils
                file
                gnugrep
                procps
                imagemagick
                wl-clipboard
              ]}
          done
        '';
      };
    });
  };
}
