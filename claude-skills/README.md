# Claude Skills

Skills and plugins used in Claude Code sessions. Split the same way as `tools/`: things I install from elsewhere just get a pointer, things I wrote myself get tracked in full.

## Installed (external)

- **[caveman](https://github.com/JuliusBrussee/caveman)**: ultra-compressed terse-response mode, cuts output tokens by dropping filler words.
- **[ponytail](https://github.com/DietrichGebert/ponytail)**: forces the laziest solution that works, YAGNI-driven, stdlib/native before new code or dependencies.

Install via Claude Code's plugin marketplace: `/plugin marketplace add <repo>` then `/plugin install <name>`.

## Custom

- **[`plain-docs/`](plain-docs/SKILL.md)**: kills hedge-y, padded technical-writing register in favor of short, direct prose. This repo is the authoritative copy. `install.sh` doesn't symlink it (dotfiles-only, doesn't touch `claude-skills/`); link it manually:
  ```bash
  ln -s ~/dotfiles/claude-skills/plain-docs ~/.claude/skills/plain-docs
  ```
