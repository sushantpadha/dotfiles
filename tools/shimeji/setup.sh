#!/usr/bin/env bash
# setup.sh — checks prerequisites and bootstraps this Shimeji-Desktop folder.
# Usage: ./setup.sh [--dry-run]
#
# What it does, in order:
#   1. Verify this is Ubuntu (via /etc/os-release).
#   2. Verify apt is available.
#   3. Ensure openjdk-25-jre is installed (apt install if missing/too old).
#   4. Verify Shimeji-ee.jar is present in this folder (you place it here
#      manually — see README.md "Getting the app").
#   5. Create img/ if missing, so install_shimeji.sh has somewhere to put packs.
#
# Every failure prints what failed, why, and what to run to fix it — nothing
# fails silently.
#
# UNTESTED: only the Ubuntu-check and --dry-run paths have been run. The
# actual `apt install openjdk-25-jre` path has not been exercised end to end
# (Java 25 was already present when this was written). Watch it the first
# time you run it for real.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DRY_RUN=false
REQUIRED_JAVA_MAJOR=25

for arg in "$@"; do
    case "$arg" in
        --dry-run) DRY_RUN=true ;;
        *) echo "Unknown arg: $arg (only --dry-run is supported)"; exit 1 ;;
    esac
done

log()  { echo "[setup] $*"; }
err()  { echo "[setup] ERROR: $*" >&2; }
run()  { if $DRY_RUN; then echo "[dry-run] $*"; else log "running: $*"; "$@"; fi; }

# Print the failing command and line number on any error, so failures are
# debuggable instead of a bare "something broke".
trap 'err "failed at line $LINENO: $BASH_COMMAND"' ERR

check_ubuntu() {
    if [[ ! -r /etc/os-release ]]; then
        err "/etc/os-release not found — can't verify this is Ubuntu. Aborting."
        exit 1
    fi
    # shellcheck disable=SC1091
    source /etc/os-release
    if [[ "${ID:-}" != "ubuntu" ]]; then
        err "This script is Ubuntu-only (apt + openjdk-25-jre from Ubuntu's repos)."
        err "Detected: ID=${ID:-unknown}, PRETTY_NAME='${PRETTY_NAME:-unknown}'."
        err "On another distro, install Java 25+ yourself and skip this script."
        exit 1
    fi
    log "OS check passed: ${PRETTY_NAME:-Ubuntu} (${VERSION_ID:-unknown})"
}

check_apt() {
    if ! command -v apt >/dev/null 2>&1; then
        err "apt not found on PATH. This script needs apt to install Java."
        exit 1
    fi
}

current_java_major() {
    # Prints the major version number, or empty if java isn't installed /
    # the version string can't be parsed. Never errors out — caller decides
    # what to do with an empty result.
    if ! command -v java >/dev/null 2>&1; then
        return 0
    fi
    java -version 2>&1 | head -n1 | grep -oE '"[0-9]+' | tr -d '"' || true
}

ensure_java() {
    local have
    have="$(current_java_major)"

    if [[ -n "$have" && "$have" -ge "$REQUIRED_JAVA_MAJOR" ]]; then
        log "Java $have already installed, satisfies >= $REQUIRED_JAVA_MAJOR. Skipping install."
        return 0
    fi

    if [[ -n "$have" ]]; then
        log "Java $have found, but Shimeji-ee needs >= $REQUIRED_JAVA_MAJOR. Installing openjdk-$REQUIRED_JAVA_MAJOR-jre."
    else
        log "No Java found. Installing openjdk-$REQUIRED_JAVA_MAJOR-jre."
    fi

    run sudo apt update
    run sudo apt install -y "openjdk-${REQUIRED_JAVA_MAJOR}-jre"

    if $DRY_RUN; then
        log "(dry-run) skipping post-install verification."
        return 0
    fi

    have="$(current_java_major)"
    if [[ -z "$have" || "$have" -lt "$REQUIRED_JAVA_MAJOR" ]]; then
        err "openjdk-${REQUIRED_JAVA_MAJOR}-jre installed but 'java' still reports version '${have:-none}'."
        err "Check 'sudo update-alternatives --config java' — another Java version may be set as default."
        exit 1
    fi
    log "Java $have confirmed active."
}

check_jar() {
    local jar="$SCRIPT_DIR/Shimeji-ee.jar"
    if [[ ! -f "$jar" ]]; then
        err "$jar not found."
        err "Download a Shimeji-Desktop build (see README.md 'Getting the app') and place"
        err "Shimeji-ee.jar, lib/, and conf/ in: $SCRIPT_DIR"
        exit 1
    fi
    log "Found Shimeji-ee.jar at $jar"
}

ensure_img_dir() {
    local img="$SCRIPT_DIR/img"
    if [[ ! -d "$img" ]]; then
        run mkdir -p "$img"
    else
        log "img/ already exists."
    fi
}

main() {
    check_ubuntu
    check_apt
    ensure_java
    check_jar
    ensure_img_dir
    log "Setup complete. Run: java -jar $SCRIPT_DIR/Shimeji-ee.jar & disown"
}

main
