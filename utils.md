# Utils

Misc standalone apps that aren't config and aren't installed via a package manager: AppImages, hand-built jars, that kind of thing. Not tracked in this repo since they're binaries, not config. This file tracks how to set them up.

`/mnt/linuxdata/utils` (local) is where these live on this machine. Any path works on a fresh one.

Current contents there:
- `Shimeji-ee_<version>/`: see [`tools/shimeji/README.md`](tools/shimeji/README.md) for setup
- `*.AppImage`: portable apps (editor, PDF reader, etc.), run directly, no install step

On a fresh machine, pick a folder and repopulate from source per each tool's own instructions. None of it needs symlinking via `install.sh`.
