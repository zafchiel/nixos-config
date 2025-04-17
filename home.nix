{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

	home = {
		username = "zafchiel";
		homeDirectory = "/home/zafchiel";
		stateVersion = "24.11";

		packages = with pkgs; [
			htop
      btop
			neofetch
			wezterm
			zsh
			neovim
			lazygit
      vivaldi
			obsidian
      eza
      zoxide
      code-cursor
      vscodium
      mailspring

      wl-clipboard
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
