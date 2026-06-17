# ===================================================================
# ALIASES
# ===================================================================
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias fd='fdfind'
alias pbcopy='xclip -selection clipboard'
alias bat='batcat'

# print folder sizes
watcher() {
    local dir="${1:-.}"
    du -h --max-depth=1 "$dir" 2>/dev/null | sort -hr
}

# peek into all subfiles of a sysfs object without repeatedly cat'ing
syspeek() {
    local root="${1:?usage: syspeek PATH}"

    find "$root" -mindepth 1 | while read -r p; do
        local rel="${p#$root/}"

        [[ -d "$p" ]] && {
            printf "\n📁 %s/\n" "$rel"
            continue
        }

        [[ ! -f "$p" ]] && continue

        case "$(basename "$p")" in
            config|resource*|rom)
                printf "📄 %s: <binary/omitted>\n" "$rel"
                continue
                ;;
        esac

        printf "📄 %s: " "$rel"

        local first
        first="$(head -n1 "$p" 2>/dev/null | tr '\0' ' ')"

        [[ -z "$first" ]] && {
            echo "<empty>"
            continue
        }

        if sed -n '2q' "$p" | grep -q . 2>/dev/null; then
            printf "%s ...\n" "$first"
        else
            printf "%s\n" "$first"
        fi
    done
}

alias rm='trash-put'

alias mv='mv -i'

alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --octal-permissions --group-directories-first --git'

brc="$HOME/.bashrc"

explorer() {
    # If no argument is given, default to current directory (.)
    local target="${1:-.}"
    xdg-open "$target" > /dev/null 2>&1 & disown
}

mann() {
    command man "$@" | batcat -l man --style=header;
}
