{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [    
    steam
    vscode-fhs
    pkgs.kdePackages.kdeconnect-kde
    pkgs.prismlauncher
    kdenlive
    krita
    brave
    tenacity
    protontricks
    yt-dlp
    openai-whisper
    xorg.xev
    wev
    xorg.xwininfo
    godot_4
    obsidian
    syncthing
    zsh
    kdePackages.discover
    mpv
    bottles-unwrapped
    davinci-resolve
    p7zip
    pcsx2
    vkbasalt
    obs-studio-plugins.obs-vkcapture
    usbimager
    rpcs3
    heroic
    gogdl
    thunderbird
    pianobooster
    ckan
    piper-tts
    pyenv
    f3
    vesktop
    xplr
    reaper
    (tetrio-desktop.override { withTetrioPlus = true; })
    (retroarch.override {
      cores = with libretro; [
        snes9x
        mgba
        fceumm
      ];
    })
  ];
  services.flatpak = {
    enable = true;
    update.onActivation = true;
    packages = [
      "org.torproject.torbrowser-launcher"
      "com.obsproject.Studio"
      "com.github.tchx84.Flatseal"
    ];
  };
}