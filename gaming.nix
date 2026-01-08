{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  home.packages = with pkgs; [
    prismlauncher
    pcsx2
    rpcs3
    ryubing
    heroic
    protonup-ng
    protontricks
    vkbasalt
    gogdl
    ckan
    nur.repos.juxgd.noriskclient-launcher
    (tetrio-desktop.override {
      withTetrioPlus = true;
    })
  ];
}
