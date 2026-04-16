{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  programs = {
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  services = {
    syncthing.enable = true;
  };

  systemd.user.services.fluxdash = {
    Unit = {
      Description = "FluxDash bot";
    };

    Install = {
      WantedBy = [ "default.target" ];
    };

    Service = {
      ExecStart = "${pkgs.writeShellScript "fluxdash-run" ''
	FLUXER_BOT_TOKEN="" /home/j/.cargo/bin/fluxdash
      ''}";
    };
  };

  home.packages = with pkgs; [
    kdePackages.kdenlive
    krita
    vivaldi
    tenacity
    yt-dlp
    wev
    clock-rs
    blender
    xplr
    reaper
    vesktop
    p7zip
    bottles
    mpv
    ncmpcpp
    kdePackages.discover
    obsidian
    zsh
    inkscape-with-extensions
    openai-whisper
    piper-tts
    bitwig-studio
    element-desktop
    zoom-us
    musescore
  ];
}
