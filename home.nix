{ config, pkgs, ... }: {
	home = {
		username = "zafchiel";
		homeDirectory = "/home/zafchiel";
		stateVersion = "24.11";

		packages = with pkgs; [
			htop
			neofetch
			wezterm
			zsh
		];
	};

	programs.home-manager.enable = true;

	programs.bash = {
		enable = true;
		shellAliases = {
			la = "ls -A";
			rebuild = "sudo nixos-rebuild switch";
		};
	};

	programs.git = {
		enable = true;
		userName = "zafchiel";
		userEmail = "bialakropla@proton.me";
		extraConfig = {
			credential.helper = "store";
		};
	};

}
