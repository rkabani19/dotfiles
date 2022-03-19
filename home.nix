{ config, pkgs, ... }:
{
  home.username = "rkabani";
  home.homeDirectory = "/Users/rkabani";
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    ./modules/nvim.nix
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
    ./modules/fzf.nix
  ];
}
