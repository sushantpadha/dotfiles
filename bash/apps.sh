# ===================================================================
# APPLICATION INITIALIZATIONS
# ===================================================================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

# Yazi shell wrapper for CWD synchronization
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

fastfetch -c ~/.config/fastfetch/config.jsonc

#. "$HOME/.cargo/env"

eval "$(zoxide init bash)"


# ===================================================================
# PROMPT
# ===================================================================
export MY_POSH_THEME=my-theme
eval "$(oh-my-posh init bash --config ~/.config/omp-themes/$MY_POSH_THEME.omp.json)"



chown dietcoke:dietcoke /home/dietcoke

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
