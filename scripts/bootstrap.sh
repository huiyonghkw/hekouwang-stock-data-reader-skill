#!/usr/bin/env bash
# 个股数据 Skill · 一键建 venv 并装依赖
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

# 依赖（pandas / akshare）暂无 3.15 wheel，优先选 3.11–3.14。
# 可用 PYTHON=/path/to/python 覆盖。
pick_python() {
  if [ -n "${PYTHON:-}" ]; then
    printf '%s\n' "${PYTHON}"
    return 0
  fi
  local c
  for c in python3.11 python3.12 python3.13 python3.14 python3; do
    if command -v "$c" >/dev/null 2>&1; then
      printf '%s\n' "$c"
      return 0
    fi
  done
  return 1
}

PYTHON_BIN="$(pick_python)" || { echo "未找到可用的 Python（建议 3.11–3.14）" >&2; exit 1; }
echo "使用 $($PYTHON_BIN --version 2>&1) ($PYTHON_BIN)"

# 已有 venv 但解释器不可用时重建
if [ -d .venv ] && ! .venv/bin/python -c 'import sys' >/dev/null 2>&1; then
  echo "现有 .venv 不可用，重建"
  rm -rf .venv
fi

if [ ! -d .venv ]; then
  "$PYTHON_BIN" -m venv .venv
fi
# shellcheck disable=SC1091
source .venv/bin/activate
python -m pip install -r requirements.txt
echo ""
echo "OK: 依赖已装进 $ROOT/.venv"
echo "激活: source .venv/bin/activate"
echo "探针: python3 scripts/fetch.py --probe"
echo "取数: python3 scripts/fetch.py 603629 ./out/603629"
