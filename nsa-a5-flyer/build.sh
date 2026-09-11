#!/usr/bin/env bash
# ==============================================================================
# SWJTU NSA A5 Flyer - Build & Export Pipeline
# Compiles duplex vector PDF and renders 150 DPI preview PNGs into dist/
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

DIST_DIR="$SCRIPT_DIR/dist"
mkdir -p "$DIST_DIR"

echo "==> [1/3] 正在通过 Chromium Headless 编译双面矢量 A5 印刷 PDF..."
chromium --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$DIST_DIR/swjtu-nsa-flyer-a5.pdf" index.html

cp "$DIST_DIR/swjtu-nsa-flyer-a5.pdf" "$DIST_DIR/nsa-a5-flyer-duplex.pdf"

echo "==> [2/3] 正在渲染高清预览图 (150 DPI)..."
pdftoppm -png -r 150 "$DIST_DIR/swjtu-nsa-flyer-a5.pdf" /tmp/nsa_render
cp /tmp/nsa_render-1.png "$DIST_DIR/preview-front.png"
cp /tmp/nsa_render-2.png "$DIST_DIR/preview-back.png"
cp "$DIST_DIR/preview-front.png" "$DIST_DIR/preview.png"
rm -f /tmp/nsa_render-*.png

echo "==> [3/3] 编译产物已输出到 dist/ 目录:"
ls -lh "$DIST_DIR"

echo "✅ 构建完成！"
