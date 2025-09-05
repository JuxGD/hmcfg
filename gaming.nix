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
            url = "file:///home/j/its-a/secret.patch";
            hash = "sha256-0ch706271vq0k2v9syppq0amg8gl367aq3xah0c701is040s9853=";
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
    (tetrio-desktop.override {
      withTetrioPlus = true;
    })
  ];
}
