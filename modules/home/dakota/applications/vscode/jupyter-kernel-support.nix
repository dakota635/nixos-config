{ pkgs, ... }:

let
  python = pkgs.python3;
in {
  home.file.".local/share/jupyter/kernels/nix-python/kernel.json".text = builtins.toJSON {
    argv = [ "${python}/bin/python3" "-m" "ipykernel_launcher" "-f" "{connection_file}" ];
    display_name = "Python (Nix)";
    language = "python";
  };
}
