{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... } @ inputs: 
  {
    nixosConfigurations.dawid = nixpkgs.lib.nixosSystem {
       system = "x86_64-linux";
       specialArgs = {inherit inputs; };
       modules = [
 	  ./configuration.nix
       ];
    };
  };
}
