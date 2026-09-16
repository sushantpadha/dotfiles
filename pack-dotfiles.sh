#!/usr/bin/env bash
# pack-dotfiles.sh — build a tarball of just the dotfiles, for scp'ing to a
# server with no GitHub access. Deliberately excludes claude-skills/,
# tools/, utils.md, CLAUDE.md — those are notes/skills for this machine,
# not things a fresh server's shell environment needs.
#
# tar.gz, not zip: tar is on every Linux box by default, unzip often isn't
# (confirmed missing on a minimal Ubuntu 18.04 server while building this).
#
# Usage: ./pack-dotfiles.sh [output.tar.gz]

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="${1:-$DOTFILES_DIR/dotfiles.tar.gz}"

cd "$DOTFILES_DIR"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "error: not a git repo (run this from inside dotfiles/)" >&2
    exit 1
fi

if [[ -n "$(git status --porcelain -- . ':!claude-skills' ':!tools' ':!utils.md' ':!CLAUDE.md' 2>/dev/null)" ]]; then
    echo "warning: uncommitted changes to dotfiles exist — this tarball is built from git's" >&2
    echo "committed HEAD, so uncommitted edits won't be included." >&2
fi

git archive --format=tar.gz -o "$OUT" HEAD -- \
    . \
    ':!claude-skills' \
    ':!tools' \
    ':!utils.md' \
    ':!CLAUDE.md'

echo "Wrote $OUT"
echo ""
echo "Transfer + install on the remote:"
echo "  scp '$OUT' user@server:~/dotfiles.tar.gz"
echo "  ssh user@server 'mkdir -p ~/dotfiles && tar -xzf ~/dotfiles.tar.gz -C ~/dotfiles && ~/dotfiles/install.sh'"
