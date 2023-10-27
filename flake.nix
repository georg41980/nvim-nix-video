{
  description = "NixOS and Home Manager configurations";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    georg-nvim-nix-video.url = "github:georg41980/nvim-nix-video";
  };
  outputs = { self, nixpkgs, home-manager, georg-nvim-nix-video }: {
    nixosConfigurations."my-hostname" = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ./configuration.nix
        georg-nvim-nix-video.nixosModule
      ];
    };
    homeConfigurations."georg" = home-manager.lib.homeManagerConfiguration {
      configuration = ./home.nix;
      modules = [
        georg-nvim-nix-video.homeModule
      ];
    };
  };
}
