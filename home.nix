{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./zsh/zsh.nix
    ./cliphist.nix
  ];

	home = {
		username = "zafchiel";
		homeDirectory = "/home/zafchiel";
		stateVersion = "24.11";

		packages = with pkgs; [
			htop
			neofetch
			wezterm
			zsh
			neovim
			lazygit
			ungoogled-chromium
			obsidian
      eza

			wget
			ripgrep
			gnumake
			unzip
			gcc
			nodejs_23
			pnpm_10
			fzf
			fd
		];
	};

	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		userName = "zafchiel";
		userEmail = "bialakropla@proton.me";
		extraConfig = {
			init.defaultBranch = "main";
			credential.helper = "store";
		};
	};

}
