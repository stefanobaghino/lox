{
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-utils.url = github:numtide/flake-utils;
    zig.url = "github:mitchellh/zig-overlay";
    zig.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, zig }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        devShells.default = nixpkgs.legacyPackages.${system}.mkShell {
          packages = [
            zig.packages.${system}.master
          ];
        };
      }
    );
}