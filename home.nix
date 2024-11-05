{ config, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
  tetriofix = inputs.tetriofix.legacyPackages.${pkgs.system};
in
{
  home.username = "j";
  home.homeDirectory = "/home/j";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  services.caffeine.enable = true;
}
