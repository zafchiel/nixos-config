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

			ripgrep
			gnumake
			unzip
			gcc
		];
	};

	programs.home-manager.enable = true;

	programs.bash = {
		enable = true;
		shellAliases = {
			la = "ls -A";
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/";
			home-switch = "home-manager switch --flake ~/nix/";
		};
	};

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
				"sudo"
				"command-not-found"
				"z"
			];
			theme = "robbyrussell";
			extraConfig = ''
				autoload -Uz compinit
				compinit

				setopt globdots # show dotfiles in autocomplete list
      '';
		};
		
		shellAliases = {
			la = "ls -A";
			lg = "lazygit";
			vim = "nvim";
			v = "nvim";
		};
		
		initExtra = ''
			# Custom ZSH configuration
			export EDITOR=nvim
			export PATH=$HOME/.local/bin:$PATH
			
			# History settings
			HISTSIZE=10000
			SAVEHIST=10000
			HISTFILE=~/.zsh_history
			setopt SHARE_HISTORY
		'';
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
