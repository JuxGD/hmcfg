{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  nixpkgs.overlays = [
    (final: prev: {
      prismlauncher-unwrapped = prev.prismlauncher-unwrapped.overrideAttrs (old: {
        patches = (old.patches or []) ++ [
            (prev.fetchpatch {
              url = "http://localhost:3000/JuxGD/its-a/raw/branch/main/secret.patch";
	      hash = "sha256-iExaBw/fAorz3vj7HJX8dV3bDlcJdFVF44s+T5whnY4=";
	    })
	];
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
    personal-nur.noriskclient-launcher
    (tetrio-desktop.override {
      withTetrioPlus = true;
    })
  ];
}
