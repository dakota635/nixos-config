{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    extraPython3Packages = py: with py; [ pybtex ];

    extraPackages = with pkgs; [
      pyright
      typos-lsp
      nixd
      nixpkgs-fmt
    ];

    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (ts: with ts; [
        nix python typescript
      ]))
      pkgs.vimPlugins.nvim-lspconfig
    ];

    extraLuaConfig = ''
      local lspconfig = require("lspconfig")

      -- Python
      lspconfig.pyright.setup{}

      -- Spelling / typos
      lspconfig.typos_lsp.setup{}

      -- Nix (nixd with nixpkgs-fmt)
      lspconfig.nixd.setup{
        settings = {
          nixd = {
            formatting = { command = { "nixpkgs-fmt" } },
          },
        },
      }

      -- LSP keymaps on attach
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
          vim.keymap.set('n', '<space>D',  vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({'n','v'}, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
        end,
      })
    '';
  };
}
