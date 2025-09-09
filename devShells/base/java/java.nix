{ pkgs, ... }:

pkgs.mkShell {
  name = "java-base";

  buildInputs = with pkgs; [
    jdk
    maven
    gradle
  ];

  shellHook = ''
    export JAVA_HOME=${pkgs.jdk}
    echo "JAVA_HOME set to $JAVA_HOME"
    echo "Entered java-base devShell"
  '';
}
