#!/bin/sh
# 教材庫的 pre-push hook 正本（SPEC_全雲端架構 §5.4）：推送前掃姓名與查詢碼，命中就擋。
# 安裝：cp scripts/pre-push.sh .git/hooks/pre-push && chmod +x .git/hooks/pre-push
# .git 經 Drive 兩台電腦共用，裝一次兩台都生效；改這份後要重新 cp。
ROOT="$(git rev-parse --show-toplevel)" || exit 2
PY=python3
command -v python3 >/dev/null 2>&1 || PY=python
exec "$PY" "$ROOT/../../Claude/dotclaude/scripts/pii-gate.py" --pre-push "$1"
