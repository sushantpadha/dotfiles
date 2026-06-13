# dotfiles

Personal dotfiles for `~`. Managed with plain symlinks via `install.sh`.

## Layout

```
dotfiles/
├── bash/           # Modular bashrc — sourced by .bashrc
│   ├── aliases.sh
│   ├── apps.sh
│   ├── env.sh
│   └── history.sh
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
├── .bashrc         # → ~/.bashrc
└── install.sh
```

## Install

```bash
git clone https://github.com/sushantpadha/dotfiles ~/dotfiles
~/dotfiles/install.sh
```

Existing files are backed up to `<file>.bak` before linking.

```bash
./install.sh            # symlink everything
./install.sh --dry-run  # preview only
./install.sh --revert   # remove symlinks, restore .bak files
```

## Sync to a remote server

**Method 1 — via GitHub (preferred):**
```bash
ssh user@server "git clone https://github.com/sushantpadha/dotfiles ~/dotfiles && ~/dotfiles/install.sh"
```

**Method 2 — rsync direct (no GitHub needed):**
```bash
rsync -av ~/dotfiles/ user@server:~/dotfiles/ && ssh user@server "~/dotfiles/install.sh"
```

> `install.sh` on a server will only link what exists — missing apps are skipped gracefully because symlinks still resolve once the app is installed later.
