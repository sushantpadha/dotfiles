#!/usr/bin/env bash
set -euo pipefail

# install_shimeji.sh
#
# Usage: ./install_shimeji.sh <path-to-zip> [character-name]
#
# Takes a shimeji.org-style zip (top-level folder containing img/, conf/,
# lib/, Shimeji.jar, etc.) and installs just the img/ contents into your
# existing Shimeji-Desktop's img/<character-name> folder.
#
# If character-name is omitted, it's derived from the zip's top-level
# folder name (cleaned up).

SHIMEJI_HOME="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_ROOT="${HOME}/Downloads/tmp"

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <path-to-zip> [character-name]"
    exit 1
fi

ZIP_PATH="$1"
CUSTOM_NAME="${2:-}"

if [[ ! -f "$ZIP_PATH" ]]; then
    echo "Error: zip file not found: $ZIP_PATH"
    exit 1
fi

if [[ ! -d "$SHIMEJI_HOME/img" ]]; then
    echo "Error: $SHIMEJI_HOME/img not found. Check SHIMEJI_HOME in this script."
    exit 1
fi

mkdir -p "$WORK_ROOT"

# Extract into a fresh temp dir under WORK_ROOT so repeated runs don't collide.
# NOTE: we use Python's zipfile instead of the `unzip` CLI here. Many old
# shimeji zips (2009-2012 era, Japanese-authored) store filenames like
# 動作.xml / 行動.xml with a flag-bit combination that `unzip` mangles into
# garbage (#U52d5#U4f5c.xml) regardless of -O UTF-8/CP932 flags. Python's
# zipfile decodes these correctly.
EXTRACT_TMP=$(mktemp -d "${WORK_ROOT}/shimeji_extract_XXXXXX")
echo "Extracting $ZIP_PATH to $EXTRACT_TMP ..."
python3 -c "
import zipfile, sys
with zipfile.ZipFile(sys.argv[1]) as z:
    z.extractall(sys.argv[2])
" "$ZIP_PATH" "$EXTRACT_TMP"

# Find the top-level folder that actually contains an img/ subfolder.
# Some zips extract flat (img/ at top level), some nest it in a named folder.
SRC_IMG_DIR=""
if [[ -d "$EXTRACT_TMP/img" ]]; then
    SRC_IMG_DIR="$EXTRACT_TMP/img"
    SRC_ROOT="$EXTRACT_TMP"
else
    # Look one level down for a folder containing img/
    CANDIDATE=$(find "$EXTRACT_TMP" -mindepth 2 -maxdepth 2 -type d -name "img" | head -n 1)
    if [[ -n "$CANDIDATE" ]]; then
        SRC_IMG_DIR="$CANDIDATE"
        SRC_ROOT=$(dirname "$CANDIDATE")
    fi
fi

if [[ -z "$SRC_IMG_DIR" ]]; then
    echo "Error: couldn't find an img/ folder anywhere in the extracted zip."
    echo "Extracted contents are in: $EXTRACT_TMP"
    echo "Inspect it manually."
    exit 1
fi

echo "Found image set at: $SRC_IMG_DIR"

# Determine character/set name.
if [[ -n "$CUSTOM_NAME" ]]; then
    SET_NAME="$CUSTOM_NAME"
else
    # Derive from the source root folder name, stripping common noise like
    # version numbers, "Shimeji_" prefixes, and trailing dots/spaces.
    RAW_NAME=$(basename "$SRC_ROOT")
    SET_NAME=$(echo "$RAW_NAME" | sed -E 's/^Shimeji[_-]?//I; s/[0-9]+\.[0-9]+.*$//; s/[_-]+$//')
    if [[ -z "$SET_NAME" ]]; then
        SET_NAME="$RAW_NAME"
    fi
fi

DEST_DIR="$SHIMEJI_HOME/img/$SET_NAME"

if [[ -d "$DEST_DIR" ]]; then
    echo "Warning: $DEST_DIR already exists. Contents will be merged/overwritten."
fi

mkdir -p "$DEST_DIR"

echo "Copying image set into: $DEST_DIR"
cp -rn "$SRC_IMG_DIR"/* "$DEST_DIR"/ 2>/dev/null || cp -r "$SRC_IMG_DIR"/* "$DEST_DIR"/

# Strip Windows cruft that sometimes ships in these zips.
find "$DEST_DIR" -iname "Thumbs.db" -delete

# If the zip ships its own actions/behaviors XML (often named with Japanese
# filenames like 動作.xml / 行動.xml), copy those alongside the img set too,
# since Shimeji-Desktop looks for img/<name>/conf/actions.xml as an override.
SRC_CONF_DIR="$SRC_ROOT/conf"
if [[ -d "$SRC_CONF_DIR" ]]; then
    DEST_CONF_DIR="$DEST_DIR/conf"
    mkdir -p "$DEST_CONF_DIR"
    cp -rn "$SRC_CONF_DIR"/* "$DEST_CONF_DIR"/ 2>/dev/null || true

    # Many old shimeji packs ship Japanese-named XML files instead of the
    # English actions.xml/behaviors.xml Shimeji-Desktop expects as overrides:
    #   動作.xml  (dousa, "action")   -> actions.xml
    #   行動.xml  (koudou, "behavior") -> behaviors.xml
    # Rename them if present and no English-named file already exists.
    # "Copy of ..." variants are skipped (usually stale duplicates).
    if [[ -f "$DEST_CONF_DIR/動作.xml" && ! -f "$DEST_CONF_DIR/actions.xml" ]]; then
        mv "$DEST_CONF_DIR/動作.xml" "$DEST_CONF_DIR/actions.xml"
        echo "Renamed 動作.xml -> actions.xml"
    fi
    if [[ -f "$DEST_CONF_DIR/行動.xml" && ! -f "$DEST_CONF_DIR/behaviors.xml" ]]; then
        mv "$DEST_CONF_DIR/行動.xml" "$DEST_CONF_DIR/behaviors.xml"
        echo "Renamed 行動.xml -> behaviors.xml"
    fi

    echo "conf/ contents:"
    ls "$DEST_CONF_DIR"
fi

echo ""
echo "Done. Installed as: $SET_NAME"
echo "Restart Shimeji-ee.jar to see it (or use 'Call Shimeji' from the tray icon)."
echo ""
echo "Leftover extracted files are still in: $EXTRACT_TMP"
echo "Safe to delete once you've confirmed everything copied correctly:"
echo "  rm -rf '$EXTRACT_TMP'"
