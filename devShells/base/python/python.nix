{ pkgs, ... }:

pkgs.mkShell {
  name = "python-base";

  buildInputs = with pkgs; [
    python3
    python3Packages.ipykernel
    python3Packages.jupyterlab
    python3Packages.pandas
    python3Packages.numpy
  ];

  shellHook = ''
    echo "Entered python-base devshell"
  '';
}
