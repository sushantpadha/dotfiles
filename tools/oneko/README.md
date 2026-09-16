# oneko

<img src="https://upload.wikimedia.org/wikipedia/commons/b/b1/Neko_animation_steps_-_falling_asleep.png" alt="oneko sprite animation" width="300">

Desktop pet that chases your mouse cursor. Considered, not currently used: X11-only (no Wayland/XWayland support), and [`shimeji`](../shimeji/README.md) covers the same ground with more characters.

Package here matches the classic mirror: [tie/oneko](https://github.com/tie/oneko).

## Install

```bash
sudo apt install oneko
```

## Running

```bash
oneko &
```

More than just a plain cat, per `man oneko` / `oneko -help`:

- **Sprites**: default neko, `-tora` (tiger stripes), `-dog`, `-sakura` (Cardcaptor Sakura), `-tomoyo` (Tomoyo Daidouji)
- **Chase targets**: `-towindow` (click a window, cat chases it instead of the pointer), `-toname <name>`, `-tofocus` (chases whatever window has focus)
- **Tuning**: `-speed <dots>`, `-time <µs>` (animation interval), `-idle <dots>` (speed threshold before the cat gives up chasing and sleeps)
- **Display**: `-fg`/`-bg` color, `-rv` (reverse video), `-position <geometry>`, `-name <name>` (for `-toname` targeting by another oneko instance)

Example: a tiger cat chasing the focused window at double speed:
```bash
oneko -tora -tofocus -speed 32 &
```

Only works under X11. Won't display on a pure Wayland session.
