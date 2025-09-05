{
  perSystem = { pkgs, ... }: {
    packages.python3 = pkgs.python3;
    packages.python3Env = pkgs.python3.withPackages (ps: [
      ps.jupyter
      ps.ipykernel
    ]);
  };
}