# ===================================================================
# ~/.bashrc
# ===================================================================

# ===================================================================
# INTERACTIVE CHECK
# ===================================================================
case $- in
    *i*) ;;
      *) return;;
esac

# Source modular bash config files
source "$HOME/dotfiles/bash/env.sh"
[ -f "$HOME/dotfiles/bash/env.local" ] && source "$HOME/dotfiles/bash/env.local"
source "$HOME/dotfiles/bash/history.sh"
source "$HOME/dotfiles/bash/aliases.sh"
[ -f "$HOME/dotfiles/bash/aliases.local" ] && source "$HOME/dotfiles/bash/aliases.local"
source "$HOME/dotfiles/bash/apps.sh"
