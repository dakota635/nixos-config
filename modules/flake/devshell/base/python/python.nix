{ inputs, ... }:

{
  imports = [ inputs.devshell.flakeModule ];

  perSystem = { config, ... }: {
    devshells.python = {
      packages = [
        config.packages.python3
        config.packages.python3Env
      ];

      commands = [
        {
          name = "desc";
          command = ''
            echo "Python: $(python --version)"
            echo "Jupyter: $(jupyter --version 2>/dev/null || echo not found)"
          '';
          category = "Info";
          help = "Show Python and Jupyter versions";
        }
      ];

      env = [
        { name = "PYTHONNOUSERSITE"; value = "1"; }
      ];
    };
  };
}