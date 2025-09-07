{
  description = "NixOS configuration";

  inputs = {
    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hyprlang.follows = "hyprland/hyprlang";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        # NixOS Hosts
        # ./modules/flake-parts/hosts/mermaid-man/flake.nix
        ./modules/flake-parts/hosts/barnacle-boy/flake.nix
        ./modules/flake-parts/hosts/dirty-bubble/flake.nix

        # Devshell
        ./modules/flake-parts/devshell/base/java/java.nix
        ./modules/flake-parts/devshell/base/java/java-packages.nix

        ./modules/flake-parts/devshell/base/python/python.nix
        ./modules/flake-parts/devshell/base/python/python-packages.nix
      ];
    };
  }
