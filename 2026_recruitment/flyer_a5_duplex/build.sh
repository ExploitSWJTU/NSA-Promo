#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"
mkdir -p dist

chromium --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="dist/swjtu-nsa_2026_recruitment_flyer_a5-duplex.pdf" index.html

pdftoppm -png -r 150 "dist/swjtu-nsa_2026_recruitment_flyer_a5-duplex.pdf" /tmp/flyer_render
mv /tmp/flyer_render-1.png dist/preview_front.png
mv /tmp/flyer_render-2.png dist/preview_back.png
