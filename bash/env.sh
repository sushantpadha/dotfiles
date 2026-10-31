# ===================================================================
# EXPORTS
# ===================================================================

# Standard local bin
export PATH="$PATH:$HOME/.local/bin"

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# Cuda
export PATH="/usr/local/cuda-13.0/bin/:$PATH"
export NVCC_CCBIN=/usr/bin/g++-15

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
#command -v batcat &>/dev/null && export MANPAGER="batcat -l man --style=header --paging=always"
export MANROFFOPT="-P-c"
export MANPAGER="sh -c 'col -bx | batcat --language=man --style=header --paging=always'"

# haskell
[ -f "/home/dietcoke/.ghcup/env" ] && . "/home/dietcoke/.ghcup/env" # ghcup-env

# https://github.com/sushantpadha/shcripts
export SHCRIPTS_DIR="$HOME/shcripts"

export HISTSIZE=100000
export HISTFILESIZE=100000

