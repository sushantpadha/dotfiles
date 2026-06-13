#!/usr/bin/env bash
# install.sh — symlink dotfiles into place, or revert them
# Usage: ./install.sh [--revert] [--dry-run]

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false
REVERT=false

for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=true ;;
        --revert)  REVERT=true ;;
        *) echo "Unknown arg: $arg"; exit 1 ;;
    esac
done

# Map: source (relative to DOTFILES_DIR) -> target
declare -A LINKS=(
    [".bashrc"]="$HOME/.bashrc"
    ["git/gitconfig"]="$HOME/.gitconfig"
    ["ssh/config"]="$HOME/.ssh/config"
    ["config/btop"]="$HOME/.config/btop"
    ["config/fastfetch"]="$HOME/.config/fastfetch"
    ["config/htop"]="$HOME/.config/htop"
    ["config/i3"]="$HOME/.config/i3"
    ["config/kitty"]="$HOME/.config/kitty"
    ["config/nvim"]="$HOME/.config/nvim"
    ["config/omp-themes"]="$HOME/.config/omp-themes"
    ["config/picom"]="$HOME/.config/picom"
    ["config/yazi"]="$HOME/.config/yazi"
)

log() { echo "[install] $*"; }
dry() { $DRY_RUN && echo "[dry-run] $*" || true; }

link_file() {
    local src="$DOTFILES_DIR/$1"
    local tgt="$2"

    if ! $REVERT; then
        # Backup existing non-symlink
        if [[ -e "$tgt" && ! -L "$tgt" ]]; then
            if $DRY_RUN; then
                dry "backup $tgt -> $tgt.bak"
            else
                log "backup $tgt -> $tgt.bak"
                mv "$tgt" "$tgt.bak"
            fi
        fi

        # Skip if already correct symlink
        if [[ -L "$tgt" && "$(readlink "$tgt")" == "$src" ]]; then
            log "skip (already linked): $tgt"
            return
        fi

        # Remove stale symlink
        if [[ -L "$tgt" ]]; then
            if $DRY_RUN; then dry "remove stale symlink $tgt"
            else rm "$tgt"; fi
        fi

        if $DRY_RUN; then
            dry "ln -s $src -> $tgt"
        else
            mkdir -p "$(dirname "$tgt")"
            ln -s "$src" "$tgt"
            log "linked: $tgt -> $src"
        fi
    else
        # REVERT: remove symlink, restore backup
        if [[ -L "$tgt" && "$(readlink "$tgt")" == "$src" ]]; then
            if $DRY_RUN; then
                dry "remove symlink $tgt"
            else
                rm "$tgt"
                log "removed symlink: $tgt"
            fi
        else
            log "skip (not our symlink): $tgt"
        fi

        if [[ -e "$tgt.bak" ]]; then
            if $DRY_RUN; then
                dry "restore $tgt.bak -> $tgt"
            else
                mv "$tgt.bak" "$tgt"
                log "restored: $tgt"
            fi
        fi
    fi
}

for rel in "${!LINKS[@]}"; do
    link_file "$rel" "${LINKS[$rel]}"
done

if $REVERT; then
    log "revert complete"
else
    log "install complete"
fi
