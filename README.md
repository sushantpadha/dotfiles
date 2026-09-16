# dotfiles

Environment setup notes for `~`: config, an install script, and app choices, kept so a fresh machine (Ubuntu 24.04, GNOME 46/Mutter, Wayland) can be rebuilt from this repo. Core configs are symlinked via `install.sh`. Standalone apps get setup notes under `tools/`, Claude Code skills under `claude-skills/`.

> [!note] Machine-specific config
> Machine-specific config is kept in files named `*.local`. Populate and track these manually.

## Install

```bash
if [ -d ~/dotfiles/.git ]; then git -C ~/dotfiles pull --ff-only; else git clone https://github.com/sushantpadha/dotfiles ~/dotfiles; fi
~/dotfiles/install.sh
```

Existing files are backed up to `<file>.bak` before linking.

```bash
./install.sh            # symlink everything
./install.sh --dry-run  # preview only
./install.sh --revert   # remove symlinks, restore .bak files
```

## Layout

```
dotfiles/
├── bash/           # Modular bashrc — sourced by .bashrc
│   ├── aliases.sh
│   ├── apps.sh
│   ├── env.sh
│   └── history.sh
├── claude-skills/  # Claude Code skills — see claude-skills/README.md
│   └── plain-docs/
├── config/         # XDG app configs → ~/.config/*
│   ├── btop/
│   ├── fastfetch/
│   ├── htop/
│   ├── i3/
│   ├── kitty/
│   ├── nvim/
│   ├── omp-themes/
│   ├── picom/
│   └── yazi/
├── git/
│   └── gitconfig   # → ~/.gitconfig
├── ssh/
│   └── config      # → ~/.ssh/config
├── tmux/
│   └── tmux.conf   # → ~/.tmux.conf
├── tools/          # Setup notes for standalone apps (not symlinked)
│   ├── lazyspotify/
│   ├── ncspot/
│   ├── oneko/
│   └── shimeji/
├── .bashrc         # → ~/.bashrc
├── install.sh
└── utils.md        # where misc non-packaged tools live locally
```

## Tools

Standalone apps that aren't dotfiles-managed config, each with a short setup note under `tools/`:

- **Music**: [`lazyspotify`](tools/lazyspotify/README.md) (current) vs [`ncspot`](tools/ncspot/README.md) (considered)
- **Desktop pets**: [`shimeji`](tools/shimeji/README.md) (current) vs [`oneko`](tools/oneko/README.md) (considered)

[`utils.md`](utils.md) covers where misc other binaries and AppImages live locally.

## Claude Skills

Claude Code skills/plugins in use, tracked in [`claude-skills/`](claude-skills/README.md): installed ones (`caveman`, `ponytail`) link back to their source repos, and custom ones (`plain-docs`) are tracked in full.

## Sync to a remote server

**Method 1, via GitHub (preferred):**
```bash
ssh user@server "if [ -d ~/dotfiles/.git ]; then git -C ~/dotfiles pull --ff-only; else git clone https://github.com/sushantpadha/dotfiles ~/dotfiles; fi; ~/dotfiles/install.sh"
```

**Method 2, rsync direct (no GitHub needed):**
```bash
rsync -av ~/dotfiles/ user@server:~/dotfiles/ && ssh user@server "~/dotfiles/install.sh"
```

`install.sh` on a server only links what exists. Missing apps are skipped gracefully; symlinks still resolve once the app is installed later.
