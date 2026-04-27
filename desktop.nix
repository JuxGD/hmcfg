{ pkgs, lib, config, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.niri.homeModules.config ];
  overlays = [ inputs.niri.overlays.default ];

  programs.niri {
    config = (builtins.readFile ./niri.kdl);
    package = pkgs.niri-package;
  };
}
