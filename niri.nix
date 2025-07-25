{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};

  niri-dotfiles = builtins.fetchFromGitHub {
    owner = "ShibamRoy9826";
    repo = "niri-dotfiles";
    rev = "b941deb448c1aaea743cf709b6cd62a751fb1e37";
  }; # this is just a little test :3
in
{
  home.file."~/Desktop/niri-dotfiles/".source = niri-dotfiles;

  home.activation = {
    applyNiriDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Applying niri dotfiles..."

      SOURCE_DIR="$HOME/Desktop/niri-dotfiles"
      TARGET_DIR="$HOME/.config"

      rm -r "$SOURCE_DIR/screenshots"
      rm "$SOURCE_DIR/README.md"

      cp -r "$SOURCE_DIR*" "$TARGET_DIR"

      echo "niri dotfiles applied!"
    '';
  };
};
