{ config, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    
    settings = {

      "$terminal" = "konsole";

      decoration = {
        shadow.enabled = false;
      };

    };
  };
}