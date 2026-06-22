# 更新日志 · hekouwang-stock-data-reader-skill

本文件记录本 Skill 的所有版本变更。格式参考 [Keep a Changelog](https://keepachangelog.com/zh-CN/)，
版本号遵循 [语义化版本 SemVer](https://semver.org/lang/zh-CN/)：`MAJOR.MINOR.PATCH`。

**变更分类**
- `功能` 新增能力 · `变更` 默认/行为调整 · `优化` 既有能力打磨 · `修复` 缺陷修正 · `移除` 删除

---

## [1.0.0]

首个有记录的版本（此前以 git 历史维护，无 CHANGELOG）。

### 修复
- **字体路径可移植化**：`scripts/build_report.py` 的 `FONTS` 由硬编码绝对家目录路径
  （指向 `hekouwang-content-factory/assets/fonts`）改为**从 `__file__` 动态推算兄弟 skill 路径**
  （两者同在 `~/.claude/skills/` 下），并支持 `HEKOUWANG_FONTS_DIR` 环境变量覆盖。换机 / 改用户名都不断字体。

### 优化
- **SKILL.md 声明 `allowed-tools`**：收敛到本 skill 真正需要的工具集，减小越权面。

### 既有能力（首版基线）
- **三步工作流**：`fetch.py`（akshare 取数）→ `analyze.py`（固定指标体系）→ `build_report.py`（出 8 贴图初稿）→ `screenshot.js`（截图、出图即删）。
- **指标体系**：价格/估值轨迹 · 主力资金进出 · 龙虎榜席位结构 · 利润质量 · 利润结构 · 资产负债 · 风险线索。
- **合规护栏内置**：不荐股 / 不预测 / 不给买卖点，文末固定风险提示条；个股内容只走公众号/头条，绝不上小红书（见 `references/compliance.md`）。
- **视觉**：默认 V2 米白「数据控制台」风，财经可选 V3 Google 财经风；贴图复用 hekouwang-content-factory 流水线。
- 首版样例：利通电子 603629。
