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
			neovim
			lazygit
			ungoogled-chromium

			ripgrep
			gnumake
			unzip
			gcc
			pnpm_10
      fzf
      fd
		];
	};

	programs.home-manager.enable = true;

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;

		plugins = [
			{
				name = "zsh-autocomplete"; # completes history, commands, etc.
				src = pkgs.fetchFromGitHub {
				  owner = "marlonrichert";
				  repo = "zsh-autocomplete";
				  rev = "762afacbf227ecd173e899d10a28a478b4c84a3f";
				  sha256 = "1357hygrjwj5vd4cjdvxzrx967f1d2dbqm2rskbz5z1q6jri1hm3";
				};
		  }
		];
		
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
				"history"
			];
			theme = "robbyrussell";
		};
		
		shellAliases = {
			la = "ls -A";
			lg = "lazygit";
			vim = "nvim";
			v = "nvim";
			pn = "pnpm";
		};
	};

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
