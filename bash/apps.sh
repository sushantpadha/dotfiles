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

command -v fastfetch &>/dev/null && fastfetch -c "$HOME/.config/fastfetch/config.jsonc"

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

command -v zoxide &>/dev/null && eval "$(zoxide init bash)"

# ===================================================================
# PROMPT
# ===================================================================
if command -v oh-my-posh &>/dev/null; then
    export MY_POSH_THEME=my-theme
    eval "$(oh-my-posh init bash --config "$HOME/.config/omp-themes/$MY_POSH_THEME.omp.json")"
fi

command -v nvm &>/dev/null || {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
