#!/bin/sh
# Run this before you publish: sh check-before-publish.sh
cd "$(dirname "$0")"
fail=0
if grep -q "DOWNLOAD_URL_PLACEHOLDER" index.html; then
  echo "NOT READY: the download link is not set. Run: sh set-download-link.sh \"https://...\""; fail=1
fi
for f in index.html privacy.html terms.html refund.html; do
  [ -f "$f" ] || { echo "Missing $f"; fail=1; }
done
grep -q "zama27@duck.com" index.html || { echo "Contact email missing on index.html"; fail=1; }
grep -q "Coming Soon on Google Play" index.html || { echo "Google Play 'Coming Soon' text missing"; fail=1; }
if [ $fail -eq 0 ]; then echo "READY to publish."; else exit 1; fi
