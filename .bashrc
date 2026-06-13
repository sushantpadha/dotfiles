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
source "$HOME/dotfiles/bash/history.sh"
source "$HOME/dotfiles/bash/aliases.sh"
source "$HOME/dotfiles/bash/apps.sh"
