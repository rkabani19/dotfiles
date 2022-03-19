{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    initExtraBeforeCompInit = ''
      fpath+="$HOME/.nix-profile/share/zsh/site-functions"
      fpath+="$HOME/.nix-profile/share/zsh/5.8/functions"
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    '';

    # TODO: Download rust and go via Nix
    sessionVariables =
      let
        pathJoin = builtins.concatStringsSep ":";
      in
      rec {
        CARGO_BIN = "$HOME/.cargo/bin";
        GOPATH = "$HOME/go";
        GOBIN = "${GOPATH}/bin";
        EDITOR = "nvim";
        PATH = pathJoin [ CARGO_BIN GOBIN "$PATH" ];
      };

    shellAliases = {
      # Git aliases
      g = "git";
      ga = "git add ";
      gb = "git branch ";
      gc = "git commit";
      gco = "git checkout ";
      gd = "git diff";
      gpf = "git push - -force-with-lease";
      gpull = "git pull";
      gpush = "git push ";
      grm = "git fetch origin master && git rebase origin/master";
      gs = "git status ";

      # Misspelled git
      got = "git ";
      get = "git ";
      gut = "git ";

      # vim to nvim
      vi = "nvim";
      vim = "nvim";

      # tmux
      ta = "tmux attach -t";
      tks = "tmux kill-session -t";
      tksv = "tmux kill-server";
      tls = "tmux ls";
      tn = "tmux new-session -s";

      # dev
      gcd = "cd ~/github.com";

      # ls
      ls = "exa";
      lsa = "exa -Fla";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" ];
      theme = "";
    };

    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "5eb494852ebb99cf5c2c2bffee6b74e6f1bf38d0";
          sha256 = "8gyZe6OPVLMdfruHJAHcyYeuiyvMTLvuX1UnUOv8eg8=";
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "1h8h2mz9wpjpymgl2p7pc146c1jgb3dggpvzwm9ln3in336wl95c";
        };
      }
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "sindresorhus";
          repo = "pure";
          rev = "v1.20.1";
          sha256 = "iuLi0o++e0PqK81AKWfIbCV0CTIxq2Oki6U2oEYsr68=";
        };
      }
    ];
  };
}
