# 个股公开数据速读 · Skill（hekouwang-stock-data-reader-skill）

输入一个 A 股代码 → 用 [akshare](https://github.com/akfamily/akshare) 拉公开数据（资金流 / 龙虎榜 / 估值band / 财务三表 / 主营构成 / 北向 / 日K）→ 算出固定指标体系 → 产出「中立事后复盘」形态的财经贴图 / 公众号长文 / 头条三件套。

**内置金融合规护栏**：不荐股、不预测涨跌、不给买卖点，自动套风险提示条。是 Claude Code / Claude Agent 的可复用 Skill，也是「3 天一只·公开数据速读」财经栏目的发动机。

## 样例（V2 米白 · 数据控制台风）

> 输入 `603629`，一条流水线跑出的报告卡（成品观感，含 HUD 取景框 / 幽灵章节号 / 自制 SVG 图表）：

| 封面 | 主力资金面 | 利润结构 |
|---|---|---|
| ![封面](examples/sample-cover.png) | ![资金面](examples/sample-fundflow.png) | ![利润结构](examples/sample-structure.png) |

一份报告 8 张一套：价格轨迹 · 主力资金进出 · 龙虎榜结构 · 利润质量 · 利润结构 · 风险线索 · 风险提示条，可发公众号 / 头条。

## 安装

```bash
pip install -r requirements.txt    # akshare + pandas，建议 venv
```

放到 `~/.claude/skills/hekouwang-stock-data-reader-skill/`，Claude Code 会自动识别。触发词见 `SKILL.md`。

## 用法（三步）

```bash
python3 scripts/fetch.py  603629  out/603629     # 取数 → CSV + _report.json
python3 scripts/analyze.py        out/603629     # 算指标 → analysis.json
python3 scripts/build_report.py   out/603629 公司简称   # 出 8 贴图初稿（数字已对）
node    templates/screenshot.js   out/603629     # 截图 output/，出图即删 HTML
```

`build_report.py` 出的是**数字正确的初稿**；中立复盘文案按 `references/report-structure.md` 人工/LLM 润色后再截图交付。

## 指标体系

价格/市值/估值轨迹 · 主力资金进出（含"涨着出货"反差日）· 龙虎榜席位结构（通道盘 vs 机构长线）· 利润质量（净利 vs 经营现金流）· 利润结构（分部收入 vs 毛利占比）· 资产负债 · 风险线索。

## 生态依赖

- **取数 + 分析（`fetch.py` / `analyze.py`）= 自包含**：只需 `akshare + pandas`，独立可跑，产出 CSV 与 `analysis.json`，不依赖任何私有资源。
- **出图（`build_report.py`）软依赖 `hekouwang-content-factory`**（会勇禾口王内容工厂 · 私有视觉系统，不公开分发）：贴图复用它的**字体（Anthropic Sans/Mono + 思源黑体）、V2 米白 / V3 财经视觉规范、`_build.py` + `screenshot.js` 流水线**。`build_report.py` 里的字体路径默认指向本机的 content-factory。
  > ⚠️ **该依赖是 PRIVATE 私有仓库，非授权无法 clone / 获取**。本公开仓库只"点名"依赖，并不分发其字体与视觉流水线；且 Anthropic Sans 为专有字体，本就不可转分发。需要成品出图请见下方「付费」。
- **没有 content-factory 时**：`fetch` / `analyze` 照常用；`build_report` 因缺字体会样式回退（功能仍跑，但不是成品观感）。

## 免费 / 付费（Freemium）

- **免费**：取数引擎 + 指标计算（`fetch.py` / `analyze.py`）+ 报告结构与合规规范。拉数据、算指标、出结构化 `analysis.json`，开源可用。
- **付费（增值服务）**：**成品级数据报告图** —— V2 米白「数据控制台」风的 8 贴图 / 公众号长文 / 头条三件套（即上方样例）。它依赖私有视觉系统（品牌字体与版式，见「生态依赖」），**不随本仓库分发**。需要出图版报告，请联系 **@huiyonghkw** 获取。

> 一句话：**取数算账免费，出「好看的报告图」找我。**

## ⚠️ 合规（务必先读 `references/compliance.md`）

- 不荐股 / 不预测 / 不给买卖点；每份报告文末固定风险提示条。
- 个股报告**只走财经账号公众号/头条，不上小红书**（小红书只发零金融词的纯方法科普）。
- 营销号数字常错，一律以 akshare 财报/乐咕口径二次核实。

## 数据源踩坑

- 估值用 `stock_value_em`（旧版 `stock_a_indicator_lg` 已不在新版 akshare）。
- 日K走 sina 源（`stock_zh_a_daily`）。
- eastmoney `push2his`（资金流/筹码）在强制代理/受限网络可能被挡，正常机器直连即可。

## 文件

| 路径 | 作用 |
|---|---|
| `SKILL.md` | Skill 入口（Claude 读这个） |
| `scripts/fetch.py` | 取数引擎（任意代码） |
| `scripts/analyze.py` | 指标计算 → analysis.json |
| `scripts/build_report.py` | 据指标出 8 贴图初稿（V2 米白） |
| `templates/screenshot.js` | 1080×1350 @2x 截图，出图即删 |
| `references/compliance.md` | 金融合规护栏 |
| `references/report-structure.md` | 栏目固定报告结构 |

---
会勇禾口王的AI笔记 · @huiyonghkw　|　数据仅供研究，不构成投资建议
