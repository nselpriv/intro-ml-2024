{
  description = "A Python 3.11 development environment with Scikit-learn, Numpy, and Pytorch";

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
          pkgs.python311Packages.pip
          pkgs.python311Packages.virtualenv
          pkgs.python311Packages.numpy
          pkgs.python311Packages.scikit-learn
          pkgs.python311Packages.pytorch
          pkgs.python311Packages.scikit-image
        ];

        # Shell hook to customize terminal and display Python version & packages
        shellHook = ''
          # Change terminal color
          echo -e "\033[0;35m" # Sets terminal text color to purple

          # Display Python version and installed packages
          echo "Welcome to your Python 3.11 development environment!"
          echo "Using Python version: $(python --version)"
          echo "Installed packages:"
          echo "  - numpy $(python -c 'import numpy; print(numpy.__version__)')"
          echo "  - scikit-learn $(python -c 'import sklearn; print(sklearn.__version__)')"
          echo "  - pytorch $(python -c 'import torch; print(torch.__version__)')"

          # Reset terminal color to default when exiting
          trap 'echo -e "\033[0m"' EXIT
        '';
      };
    });
}
