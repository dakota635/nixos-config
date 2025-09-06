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

    inputs.import-tree.url = "github:vic/import-tree";

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

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; }
      systems = [ "x86_64-linux" ];

      options = {
        custom.nixosConfigPath = inputs.nixpkgs.lib.mkOption {
          type = inputs.nixpkgs.lib.types.str;
          description = "The absolute path to the NixOS configuration directory.";
        };
      };

      config = {
        custom.nixosConfigPath = "/home/dakota/nixos-config";
      };

      imports = [
        (import-tree ./modules)
      ];
    };
  }
