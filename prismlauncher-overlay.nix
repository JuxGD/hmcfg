final: prev: {
  prismlauncher-unwrapped = prev.prismlauncher-unwrapped.override {
    src = pkgs.fetchgit {
      url = "file:///home/j/GitRepos/PrismLauncher";
      rev = "0e6517f2074e5a33f22f972e50d7324284ef9bef";
      fetchSubmodules = true;
      deepClone = true;
      hash = "bafddfaa18a3c345c3135c1455eb209c4b9142737e396a65588c4126153ca5ee";
    };
  };
}
