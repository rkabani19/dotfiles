{ config, pkgs, lib, ... }:
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];

  programs.neovim = {
    package = pkgs.neovim-nightly;
    enable = true;
    extraConfig = builtins.readFile ../init.vim; # temp until all vim stuff is set up
    vimAlias = true;
    viAlias = true;
    plugins = with pkgs.vimPlugins; [
      # Theme
      nordic-nvim
      # Tree (testing)
      nvim-tree-lua
      # LSP + Autocomlete
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp_luasnip
      luasnip
      # Language Specific
      rust-tools-nvim
      # Git
      vim-fugitive
      gitsigns-nvim
      # Show history
      undotree
      # Search
      fzf-vim
      # Status and tabline
      lualine-nvim
      # Autobracketting
      nvim-autopairs
      vim-surround
      # Comments
      vim-commentary
      # Telescope
      popup-nvim
      plenary-nvim
      telescope-nvim
      telescope-fzy-native-nvim
      nvim-treesitter
    ];
  };
}
