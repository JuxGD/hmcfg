{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  nixpkgs.overlays = [
    (final: prev: {
      prismlauncher-unwrapped = prev.prismlauncher-unwrapped.overrideAttrs (finalAttrs: previousAttrs: {
        src = pkgs.fetchgit {
          url = "file:///home/j/GitRepos/PrismLauncher";
	  rev = "70465067cb6bf192675bbda47eb88b175c2a7174";
	  fetchSubmodules = true;
	  deepClone = true;
	  hash = "sha256-01jz3bfgw9givbr08ac0r5mvhckvch8nmhi521gq2w1xgr0ffw43";
	};
      });
    })
  ];

  home.packages = with pkgs; [
    prismlauncher
    pcsx2
    rpcs3
    ryubing
    heroic
    protonup
    protontricks
    vkbasalt
    gogdl
    ckan
    (tetrio-desktop.override {
      withTetrioPlus = true;
    })
  ];
}
