{ ... }:

{
  imports = [
    ./kernel-package/kernel-package.nix
    ./plymouth/plymouth.nix
    ./settings/silent-boot.nix
  ];
}