#!/usr/bin/env bash

set -euo pipefail

if [ -z "${1:-}" ]; then
    echo "Usage: $0 <path-to-svg-directory>" >&2
    exit 1
fi

DIRECTORY=$(cd "$1" && pwd)
DIST="$DIRECTORY"
RESOURCES="$DIRECTORY/../../../../resources/svg"

echo "Compiling icons..."

for FILE in "$DIST"/*.svg; do
    sed -e 's/ class="[^\"]*"//g' -e '/<path stroke="none" d="M0 0h24v24H0z" fill="none"\/>/d' -e '/^$/d' "$FILE" > "$RESOURCES/${FILE##*/}"
done

echo "All done!"
