{
  description = "A development environment with Anaconda and Python 3.11";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShells.default = pkgs.mkShell {
        buildInputs = [
          pkgs.python311
          pkgs.python311Packages.conda
        ];

        # Optional: Shell hook to display Anaconda version
        shellHook = ''
          echo "Using Anaconda version: $(conda --version)"
          echo "Using Python version: $(python --version)"
        '';
      };
    });
}
