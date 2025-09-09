{ ... }:

{
  imports = [
    ./git/git.nix
    ./neovim/neovim.nix
    ./vscode/vscode.nix
    ./vscode/jupyter-support.nix
  ];
}
