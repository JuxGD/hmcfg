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

      bind = {
        CTRL + ALT, code:68, exec, konsole;
      };

      decoration = {
        shadow.enabled = false;
      };

    };
  };
}
