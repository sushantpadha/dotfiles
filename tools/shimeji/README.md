# Shimeji Desktop Pet Setup

<img src="https://kilkakon.com/shimeji/title.png" alt="Shimeji-ee" width="400">

Animated desktop mascots that wander/climb around your screen. Runs fine on GNOME 46/Wayland via XWayland.

Runs instead of [`oneko`](../oneko/README.md): X11-only, one sprite, no packs. Shimeji-Desktop supports multiple characters, custom behaviors, and a large community pack library.

This folder tracks setup tooling only (this README, `setup.sh`, `install_shimeji.sh`). The jar, `lib/`, and `img/` packs are binaries, not config, so they aren't in git; assemble them locally.

## Requirements

Java 25+. App: [DalekCraft2/Shimeji-Desktop](https://github.com/DalekCraft2/Shimeji-Desktop) (this JDK-25 fork, matches what's installed here). Grab a release, drop the jar/`lib/`/`conf/` into this folder next to `install_shimeji.sh`.

```bash
./setup.sh            # Ubuntu-only: checks Java 25, apt-installs it if missing, verifies the jar is here
./setup.sh --dry-run   # preview what it would run
```

`setup.sh` doesn't fetch the jar for you (no pinned source, see above); it aborts with the path to drop it in if it's missing. **Untested**: only the Ubuntu-check and `--dry-run` paths have been run so far; the real `apt install` path hasn't been exercised end to end. Watch it closely the first time.

```bash
java -jar Shimeji-ee.jar & disown
```

Quit via tray icon → Dismiss All.

## Adding characters

Packs from [shimeji.org](https://shimeji.org):

```bash
./install_shimeji.sh <path-to-zip> [character-name]
```

Handles zips with Japanese filenames/config XML that plain `unzip` mangles; installs into `img/<character-name>/`. Restart the jar to pick it up. Character name defaults to the zip's folder name if omitted.

## Notes

Delete a pack's subfolder under `img/` to remove it. Move unused packs to `img/unused/` if too many active characters eat memory.
