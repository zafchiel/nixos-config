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
		enableAutosuggestions = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;
		
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
				"docker"
				"history"
				"sudo"
				"autojump"
				"command-not-found"
			];
			theme = "robbyrussell";
		};
		
		shellAliases = {
			la = "ls -A";
			rebuild = "sudo nixos-rebuild switch --flake ~/nix/";
			home-switch = "home-manager switch --flake ~/nix/";
			lg = "lazygit";
			vim = "nvim";
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
			
			# Enable Vi mode
			bindkey -v
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
