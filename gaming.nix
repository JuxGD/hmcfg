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
	  rev = "0e6517f2074e5a33f22f972e50d7324284ef9bef";
	  fetchSubmodules = true;
	  deepClone = true;
	  hash = "bafddfaa18a3c345c3135c1455eb209c4b9142737e396a65588c4126153ca5ee";
	};
      )};
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
