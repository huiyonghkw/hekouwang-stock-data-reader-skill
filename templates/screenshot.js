// 贴图截图器 1080×1350 @2x —— 扫描目标目录 NN-*.html，截到 output/，出图即删 HTML。
// 用法：node screenshot.js [贴图目录]（默认当前目录）
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');
const chrome = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
const W = 1080, H = 1350;
const dir = path.resolve(process.argv[2] || '.');
const outDir = path.join(dir, 'output');
if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });
const files = fs.readdirSync(dir).filter(f => /^\d{2}-.*\.html$/.test(f)).sort();
for (const file of files) {
  const htmlPath = path.join(dir, file);
  const outPath = path.join(outDir, file.replace('.html', '.png'));
  const cmd = `"${chrome}" --headless=new --allow-file-access-from-files --disable-gpu --no-sandbox --window-size=${W},${H} --hide-scrollbars --force-device-scale-factor=2 --screenshot="${outPath}" --virtual-time-budget=6000 "file://${htmlPath}"`;
  try {
    execSync(cmd, { stdio: 'pipe', timeout: 45000 });
    fs.unlinkSync(htmlPath);   // 出图即删
    console.log('✓', file);
  } catch (e) {
    console.error('✗', file, '(截图失败，保留 HTML 供排查)');
  }
}
console.log('done:', files.length, 'shots →', outDir);
