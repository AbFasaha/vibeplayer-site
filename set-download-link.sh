#!/bin/sh
# Usage: sh set-download-link.sh "https://your-direct-download-link"
# Puts your real APK link into the two Download buttons on index.html.
set -e
URL="$1"
if [ -z "$URL" ]; then echo "Usage: sh set-download-link.sh \"https://...\""; exit 1; fi
case "$URL" in
  https://*) ;;
  *) echo "The link must start with https://"; exit 1 ;;
esac
case "$URL" in
  *'|'*|*' '*|*'"'*|*'&'*) echo "The link must not contain spaces, quotes, | or &."; exit 1 ;;
esac
cd "$(dirname "$0")"
if ! grep -q "DOWNLOAD_URL_PLACEHOLDER" index.html; then
  # Already set once: replace the old link in the two download buttons.
  sed -i "s|\(data-download href=\"\)[^\"]*\"|\1$URL\"|g" index.html
else
  sed -i "s|DOWNLOAD_URL_PLACEHOLDER|$URL|g" index.html
fi
echo "Download buttons now point to: $URL"
grep -c "data-download href=\"$URL\"" index.html | sed 's/^/Buttons updated: /'
