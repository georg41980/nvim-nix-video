{ config, pkgs, ... }:

{
  home.username = "georg";
  home.homeDirectory = "/home/georg";
  home.stateVersion = "22.11";

  nixpkgs.overlays = [
    (final: prev: {
      vimPlugins = prev.vimPlugins // {
        own-onedark-nvim = prev.vimUtils.buildVimPlugin {
          name = "onedark";
          src = builtins.fetchGit {
            url = "https://github.com/NTBBloodbath/onedark.nvim";
            ref = "v3.2.0";
          };
        };
      };
    })
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };
}
