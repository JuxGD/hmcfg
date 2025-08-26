{ config, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  programs = {
    neovim.enable = true;

    pay-respects.enable = true;

    home-manager.enable = true;

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch --upgrade";
        bashrc = "nano ~/.bashrc";
        zshrc = "nano ~/.zshrc";
        nixchk = "(cd /etc/nixos && sudo git status)";
        hmrbld = "home-manager switch";
        hmcfg = "home-manager edit";
      };

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "amuse";
      };
    };
  };
}
