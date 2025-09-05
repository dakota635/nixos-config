{ inputs, ... }:

{
  imports = [ inputs.devshell.flakeModule ];

  perSystem = { config, ... }: {
    devshells.java = {
      packages = [
        config.packages.jdk
        config.packages.gradle
      ];

      commands = [
        {
          name = "desc";
          command = ''
            echo "JDK: $(java -version 2>&1 | head -n 1)"
            echo "Gradle: $(gradle --version 2>/dev/null || echo not found)"
          '';
          category = "Info";
          help = "Show Java and Gradle versions";
        }
      ];

      env = [
        { name = "JAVA_HOME"; value = "${config.packages.jdk}/libexec/openjdk.jdk/Contents/Home"; }
      ];
    };
  };
}