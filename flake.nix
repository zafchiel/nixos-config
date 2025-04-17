{
	description = "My system config";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};	
	};

	outputs = { nixpkgs, home-manager, ... }: 
		let
			system = "x86_64-linux";
		in {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [ ./configuration.nix ];
		};

		homeConfigurations.zafchiel = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home.nix ];
		};
	};

}
