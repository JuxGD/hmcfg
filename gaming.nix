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
        src = builtins.fetchGit {
          url = "file:///home/j/GitRepos/PrismLauncher";
	  rev = "70465067cb6bf192675bbda47eb88b175c2a7174";
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
