# SWJTU NSA · A5 招新宣传单（双面极客版）

这是一个可离线打开的单页静态网页，画布按标准 **A5 竖版（148 × 210 mm）** 双面排版制作。

## 📐 正反面设计规格

- **正面 FRONT（上黑下白 2:1）**：
  - 上 2/3：深色科技线框、网络节点地图、动态数据矩阵、暗黑黑客窗口（`hacker.jpg`）与终端窗口（内置 `cat secret` Base64 密文彩蛋 `ZmxhZ3txcV9ncm91cF85ODI0OTQxNDV9`）。
  - 下 1/3：纯白介绍区，双栏大字号占位标题与 SVG 矢量招新二维码（直接跳转 QQ 招新群）。
- **背面 BACK（上白下黑 2:1 色调翻转）**：
  - 上 2/3（纸白）：参考《Builders Table》设计语言。包含愿景宣言栏、4 列核心硬核数据矩阵（`10+` / `4` / `50+` / `0`）、现场监控视窗（`cyber-feed.jpg`）+ 四大攻防方向（Web、Pwn、Crypto、Defense）、4 阶段新人成长阶梯。
  - 下 1/3（深色终端）：模拟 Bash 终端执行 `cat join_us.txt`，左侧输出**全高全宽、无间隙 Unicode 字符二维码（实测手机摄像头可直接扫码加入 QQ 群）**，右侧输出 `EXPLOIT SWJTU` 紧凑字符艺术字与战备连接元数据。

## 🔄 正反面无感切换与交互

- **顶部悬浮控制条（.side-switcher）**：
  - 采用固定胶囊浮层（`position: fixed`），**完全不占海报流式空间，对 A5 画布尺寸与边距零干扰**。
  - 支持直接点击 `[正面 FRONT]` / `[背面 BACK]` 按钮。
  - **导出 PDF**：点击 `[ 🖨️ 导出 PDF ]` 原生调出浏览器打印面板，支持一键导出标准 A5 双面矢量 PDF；点击 `[ 📥 下载现成件 ]` 直接下载本地预渲染完成的 PDF。
  - **快捷键**：
    - 按键盘 <kbd>Space</kbd>（空格）、<kbd>F</kbd> 或方向键（`←` / `→`）切换正反面。
    - 按键盘 <kbd>P</kbd> 直接呼出 PDF 导出面板。
  - **直接链接定位**：支持通过 URL Hash `#front` 或 `#back` 直接定位展示对应面。
## 📁 工程目录架构（最佳实践分类）

本项目严格遵循现代前端与视觉工程最佳实践，按**主体源码、正式资产、过程临时素材、产物输出**分层隔离：

```text
nsa-a5-flyer/
├── assets/                       # [图片资产] 项目运行时依赖的正式媒体与矢量素材
│   ├── hacker.jpg                # 正面黑客人物视窗背景（已做平滑过渡与降噪）
│   ├── party.jpg                 # 背面线下聚会交流照片（已按 16:10.5 构图裁剪）
│   ├── logo-remake.svg           # SWJTU NSA 矢量重绘徽标
│   ├── qq-group-qr.svg           # QQ 招新群跳转矢量二维码
│   └── cyber-feed.jpg            # 赛博监控雷达补充资产
├── temp/                         # [临时文件] 原始未经裁剪素材及制作过程文件（已加入 .gitignore）
│   ├── hacker-raw.jpg            # 原始未处理黑客人物底图
│   └── party-raw.jpg             # 原始未裁剪聚会大合照
├── dist/                         # [构建产物] 自动化脚本编译生成的印刷成品与效果图
│   ├── swjtu-nsa-flyer-a5.pdf    # 双面 A5 标准矢量印刷 PDF（300 DPI 印刷级）
│   ├── nsa-a5-flyer-duplex.pdf   # 印刷厂交付用双面备用副本
│   ├── preview-front.png         # 正面 150 DPI 高清效果预览图
│   ├── preview-back.png          # 背面 150 DPI 高清效果预览图
│   └── preview.png               # 项目全局快速预览封面
├── build.sh                      # [构建工具] 一键调用 Chromium Headless 编译 PDF 与预览图
├── index.html                    # [主体源码] 宣传单核心排版、样式与无依赖交互代码
├── .gitignore                    # [版本控制] 忽略临时文件、构建缓存与系统临时项
└── README.md                     # [项目文档] 项目设计规范与使用指南
```

## 🛠️ 自动化编译构建指南

直接在项目目录下运行构建脚本即可重新生成全部 PDF 印刷件与 PNG 预览：

```bash
# 给予执行权限（首次）并运行构建
./build.sh
```

- 编译产物将自动写入 `dist/` 目录，不污染源码根目录。
- `index.html` 中的 “[ 📥 下载现成件 ]” 按钮已自动指向 `dist/swjtu-nsa-flyer-a5.pdf`。


