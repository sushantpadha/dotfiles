# lazyspotify

<img src="https://raw.githubusercontent.com/dubeyKartikay/lazyspotify/main/docs/assets/logo.png" alt="lazyspotify" width="400">

The Spotify client that actually runs day to day, over [`ncspot`](../ncspot/README.md).

Repo: [dubeyKartikay/lazyspotify](https://github.com/dubeyKartikay/lazyspotify). Its README covers setup end to end, including registering your own app on the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard) and pasting the client ID into `config.yml` (required, no shared client ID).

## Install

Installed here as a local `.deb` (`apt-cache policy` shows it as `local`, not from a tracked apt repo). Grab the release `.deb` and install with:
```bash
sudo dpkg -i lazyspotify_<version>_amd64.deb
sudo apt-get install -f   # pull in any missing deps
```

## Running

```bash
lazyspotify
```

## Notes

Version last used here: `0.5.1`. No config tracked in this repo; reinstall and redo the client ID setup fresh on a new machine.
