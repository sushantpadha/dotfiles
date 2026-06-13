# ===================================================================
# EXPORTS
# ===================================================================
# Add ~/.local/bin to the PATH
export PATH="$PATH:/home/dietcoke/.local/bin:/usr/local/MATLAB/R2025b/bin"
export PATH="$PATH:/home/dietcoke/tools/z3-4.15.4-x64-glibc-2.39/bin"
export PYTHONPATH="$PYTHONPATH:/home/dietcoke/tools/z3-4.15.4-x64-glibc-2.39/bin/python"
export BOOST_ROOT="/usr/local"
export LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
export CPLUS_INCLUDE_PATH="/usr/local/include:$CPLUS_INCLUDE_PATH"

# Go install
export PATH=$PATH:/usr/local/go/bin
# GOPATH
# /home/dietcoke/go

# Ensure Cargo binaries are available
export PATH="$HOME/.cargo/bin:$PATH"

# its better to simply export a better MANPAGER for man
# revert it to less if shit breaks with: `MANPAGER=less man ...`
export MANPAGER="batcat -l man --style=header --paging=always"
