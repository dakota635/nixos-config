{
  perSystem = { pkgs, ... }: {
    packages.jdk = pkgs.jdk;
    packages.gradle = pkgs.gradle;
  };
}