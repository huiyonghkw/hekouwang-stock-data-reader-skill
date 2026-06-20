# VHS 录制脚本 —— 生成 examples/demo.gif（真实安装+使用）
# 用法：cd 到 skill 根目录，vhs examples/demo.tape
Output examples/demo.gif

Set Shell bash
Set FontSize 16
Set Width 1180
Set Height 760
Set Padding 18
Set Theme "Catppuccin Mocha"
Set TypingSpeed 28ms

Hide
Type "cd ~/.claude/skills/hekouwang-stock-data-reader-skill && source .venv/bin/activate && clear"
Enter
Sleep 1s
Show

Type "# 个股公开数据速读 · 输入一个代码 → 合规中立复盘报告"
Enter
Sleep 800ms
Type "# (1) 安装：只要 akshare + pandas，零 API key"
Enter
Sleep 400ms
Type "pip install -q -r requirements.txt && echo '依赖就绪 ✓'"
Enter
Sleep 2500ms
Type "# (2) 取数：输入一个代码，自动拉多源公开数据"
Enter
Sleep 400ms
Type "python scripts/fetch.py 603629 out/603629"
Enter
Sleep 13s
Type "# (3) 算内核：龙虎榜 / 利润质量 / 利润结构 / 估值"
Enter
Sleep 400ms
Type "python scripts/analyze.py out/603629"
Enter
Sleep 4500ms
Type "# (4) 出报告：一套 V2 米白「数据控制台」风贴图"
Enter
Sleep 400ms
Type "python scripts/build_report.py out/603629 利通电子"
Enter
Sleep 2500ms
Type "ls -1 out/603629/output/"
Enter
Sleep 3s
