{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};

  niri-dotfiles = pkgs.fetchFromGitHub {
    owner = "ShibamRoy9826";
    repo = "niri-dotfiles";
    rev = "b941deb448c1aaea743cf709b6cd62a751fb1e37";
    hash = "sha256-K3JeEJsk8ginvoPE9S2gzpyuBY0ydk+aSVh7WXMeCqU=";
  }; # this is just a little test :3
in
{
  home.file.".config/anyrun" = {
    source = "${niri-dotfiles}/anyrun";
    recursive = true;
  };

  home.file.".config/fastfetch" = {
    source = "${niri-dotfiles}/fastfetch";
    recursive = true;
  };

  home.file.".config/mpd" = {
    source = "${niri-dotfiles}/mpd";
    recursive = true;
  };

  home.file.".config/ncmpcpp" = {
    source = "${niri-dotfiles}/ncmpcpp";
    recursive = true;
  };

  home.file.".config/niri" = {
    source = "${niri-dotfiles}/niri";
    recursive = true;
  };

  home.file.".config/waybar" = {
    source = "${niri-dotfiles}/waybar";
    recursive = true;
  };

  home.file.".config/wlogout" = {
    source = "${niri-dotfiles}/wlogout";
    recursive = true;
  };
}
