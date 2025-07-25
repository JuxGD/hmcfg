{ config, lib, pkgs, inputs, ... }:

let
  stable = inputs.stable.legacyPackages.${pkgs.system};
  master = inputs.master.legacyPackages.${pkgs.system};
  staging = inputs.staging.legacyPackages.${pkgs.system};
in
{
  home.activation = {
    applyNiriDotfiles = lib.hm.dag.entryAfter ["writeBoundary"] ''
      echo "Applying niri dotfiles..."

      SOURCE_DIR="$HOME/Desktop/niri-dotfiles"
      TARGET_DIR="$HOME/.config"

      git clone https://github.com/ShibamRoy9826/niri-dotfiles $SOURCE_DIR

      rm -r "$SOURCE_DIR/screenshots"
      rm "$SOURCE_DIR/README.md"

      cp -r "$SOURCE_DIR*" "$TARGET_DIR"

      echo "niri dotfiles applied!"
    '';
  };
}
