{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "org.torproject.torbrowser-launcher"
      "com.obsproject.Studio"
      "com.github.tchx84.Flatseal"
      "studio.kx.carla"
      "org.upscayl.Upscayl"
      "sh.ppy.osu"
      "io.mrarm.mcpelauncher"
      "im.dino.Dino"
      "org.gimp.GIMP"
      "org.kde.kdenlive"
    ];
  };
}
