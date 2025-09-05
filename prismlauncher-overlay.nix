{ pkgs, lib, config, inputs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      prismlauncher-unwrapped = prev.prismlauncher-unwrapped.overrideAttrs (old: {
        src = builtins.fetchgit {
          url = "file:///home/j/GitRepos/PrismLauncher";
          rev = "70465067cb6bf192675bbda47eb88b175c2a7174";
          fetchSubmodules = true;
          deepClone = true;
          hash = "39b15ab6f0dabb608ca591ceff2494e8d6e53f2564ded3f4812e8914c934847e";
        };
      });
    })
  ];
}
