{ config, pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    git
    tmux
    exa
    rnix-lsp
  ];
}
