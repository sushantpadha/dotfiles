# ===================================================================
# EXPORTS
# ===================================================================

# Standard local bin
export PATH="$PATH:$HOME/.local/bin"

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Go
[ -d /usr/local/go/bin ] && export PATH="$PATH:/usr/local/go/bin"

# Machine-specific: MATLAB
[ -d /usr/local/MATLAB/R2025b/bin ] && export PATH="$PATH:/usr/local/MATLAB/R2025b/bin"

# Machine-specific: z3
[ -d "$HOME/tools/z3-4.15.4-x64-glibc-2.39/bin" ] && {
    export PATH="$PATH:$HOME/tools/z3-4.15.4-x64-glibc-2.39/bin"
    export PYTHONPATH="$PYTHONPATH:$HOME/tools/z3-4.15.4-x64-glibc-2.39/bin/python"
}

# Use bat as manpager if available
command -v batcat &>/dev/null && export MANPAGER="batcat -l man --style=header --paging=always"
