# 2026 招新 A5 双面传单

西南交通大学网络安全协会 2026 招新宣传单，标准 A5 竖版（148 × 210 mm）双面排版。

## 规格与依赖

- 尺寸：A5（148mm × 210mm）
- 字体：JetBrains Mono、PingFang SC / Noto Sans SC
- 依赖：Chromium、poppler-utils (`pdftoppm`)

## 构建

```bash
./build.sh
```

输出至 `dist/`：
- `swjtu-nsa_2026_recruitment_flyer_a5-duplex.pdf`：双面矢量印刷 PDF
- `preview_front.png` / `preview_back.png`：150 DPI 高清预览图
