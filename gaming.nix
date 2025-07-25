{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  programs = {
    steam = {
      enable = true;
      package = (pkgs.steam.override {
        extraPkgs = (pkgs: [
          pkgs.corefonts
          pkgs.vistafonts
        ]);
      });
      gamescopeSession.enable = true;
    };
  };

  home.packages = with pkgs; [
    prismlauncher
    pcsx2
    rpcs3
    ryujinx
    heroic
    protonup
    protontricks
    vkbasalt
    gogdl
    ckan
    tetrio-plus
  ];
}
