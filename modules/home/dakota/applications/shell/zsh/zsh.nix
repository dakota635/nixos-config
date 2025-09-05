{ ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = "fastfetch";

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /home/dakota/nixos-config";
      dev-java = "nix develop .#devshells.java";
      dev-python = "nix develop .#devshells.python";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "gh" "docker" ];
    };
  };
}
