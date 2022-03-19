{ config, pkgs, ... }:
let
  email = "rohail.kabani@gmail.com";
  name = "Rohail Kabani";
  user = "rkabani19";
in
{
  programs.git = {
    enable = true;
    extraConfig = {
      branch.sort = "-committerdate";
      color.ui = true;
      core.commitGraph = true;
      credential.helper = "osxkeychain";
      diff.algorithm = "patience";
      fetch.prune = true;
      gc.writeCommitGraph = true;
      github.user = user;
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      pull.rebase = false;
    };
    delta = {
      enable = true;
      options = {
        syntax-theme = "Nord";
        line-numbers = true;
        line-numbers-zero-style = "#4C566A";
      };
    };
    userEmail = email;
    userName = name;
  };
}
