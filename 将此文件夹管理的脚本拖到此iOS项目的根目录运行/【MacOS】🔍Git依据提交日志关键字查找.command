#!/bin/zsh
# ================================== git-branch-origin-from-desc ==================================
# 仅通过 commit 描述（subject）推断：当前分支最初从哪个分支切出来
# - 自动：匹配 “Merge … into <当前分支> / 合并…到 <当前分支>”
# - 回退：交互输入关键字（或用 fzf 选择）在提交描述里定位“锚点提交”
# ================================================================================================

set -e
set -u
set -o pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"

# ---------- 彩色 & 日志 ----------
SCRIPT_BASENAME="${0:t:r}"
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"

# 屏幕+日志（stdout），用于常规输出
log()            { local msg="$1"; printf '%b\n' "$msg"; printf '%b\n' "$msg" >> "$LOG_FILE"; }
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }
gray_echo()      { log "\033[0;90m$1\033[0m"; }

# 只写 TTY+日志（不碰 stdout），用于需要把 stdout 当“返回值”的函数
tty_log()     { local msg="$1"; printf '%b\n' "$msg" > /dev/tty; printf '%b\n' "$msg" >> "$LOG_FILE"; }
info_tty()    { tty_log "\033[1;34mℹ $1\033[0m"; }
success_tty() { tty_log "\033[1;32m✔ $1\033[0m"; }
warn_tty()    { tty_log "\033[1;33m⚠ $1\033[0m"; }
error_tty()   { tty_log "\033[1;31m✖ $1\033[0m"; }

# ---------- 横幅/自述 ----------
show_banner() {
  cat <<'EOF'
┌──────────────────────────────────────────────────────────────┐
│  git-branch-origin-from-desc (zsh)                           │
│  自动：匹配 “Merge … into <当前分支> / 合并…到 <当前分支>”     │
│  回退：输入关键字（或 fzf 选择）在提交描述里定位锚点          │
└──────────────────────────────────────────────────────────────┘
EOF
}
intro() {
  show_banner
  print -r -- "按回车继续（Ctrl+C 退出）..." > /dev/tty
  read -r _ < /dev/tty || true
}

# ---------- 去 ANSI ----------
strip_ansi() { perl -pe 's/\e\[[0-9;]*[A-Za-z]//g'; }

# ---------- 路径处理 ----------
sanitize_path() {
  local p; p="$(print -r -- "$1" | strip_ansi)"
  # 去首尾空白
  p="${p#"${p%%[![:space:]]*}"}"
  p="${p%"${p##*[![:space:]]}"}"
  # 去包裹引号
  p="${p%\"}"; p="${p#\"}"
  p="${p%\'}"; p="${p#\'}"
  # 去掉 CR（拖拽/某些终端会混入 \r）
  p="${p//$'\r'/}"
  # 展开 ~
  [[ "$p" == "~"* ]] && p="${p/#\~/$HOME}"
  # 去尾 /
  [[ "$p" != "/" ]] && p="${p%/}"
  print -r -- "$p"
}

abs_path() {
  local p; p="$(sanitize_path "$1")"; [[ -z "$p" ]] && return 1
  if command -v realpath >/dev/null 2>&1; then realpath "$p" 2>/dev/null || return 1
  else
    if [[ -d "$p" ]]; then ( builtin cd -- "$p" 2>/dev/null && pwd -P ) || return 1
    elif [[ -f "$p" ]]; then ( builtin cd -- "${p:h}" 2>/dev/null && printf '%s/%s\n' "$(pwd -P)" "${p:t}" ) || return 1
    else return 1; fi
  fi
}

# ---------- Git 判定 ----------
is_git_repo() {
  local dir="$1"
  # 工作副本：.git 目录或 .git 文件（worktree 等）
  [[ -d "$dir/.git" || -f "$dir/.git" ]] && return 0
  # 裸仓库（可选）
  [[ -f "$dir/HEAD" && -d "$dir/objects" && -d "$dir/refs" ]] && return 0
  return 1
}

# ---------- 询问直到 Git 仓库（stdout 只输出路径） ----------
ask_git_repo() {
  local default_dir="$1"
  local candidate="" ap=""

  while :; do
    print -r -- "📂 请拖入/输入 Git 仓库目录（直接回车 = 使用脚本所在目录）：" > /dev/tty
    print -n -- "> " > /dev/tty
    IFS= read -r candidate < /dev/tty || candidate=""
    candidate="$(sanitize_path "$candidate")"

    # 选默认或输入
    if [[ -z "$candidate" ]]; then
      ap="$(abs_path "$default_dir" || true)"
    else
      ap="$(abs_path "$candidate" || true)"
    fi

    # 校验
    if [[ -n "${ap:-}" && -d "$ap" ]]; then
      if is_git_repo "$ap"; then
        success_tty "确认 Git 仓库：$ap"
        typeset -g SCRIPT_DIR="$ap"   # ← 关键：强制写全局，避免被上层 local 遮蔽
        # 进入仓库目录（解析符号链接，安全处理空格/中文）
        builtin cd -P -- "$SCRIPT_DIR" || { print -ru2 -- "✖ 无法进入目录：$SCRIPT_DIR"; exit 1; }
        print -r -- "📍 当前目录：$PWD" > /dev/tty
        return 0
      else
        error_tty "不是 Git 仓库：$ap"
      fi
    else
      error_tty "无效路径：${candidate:-<空>}"
    fi
  done
}

# ---------- 当前分支 ----------
current_branch_name() { git -C "$1" rev-parse --abbrev-ref HEAD; }

# ---------- 解析 subject：输出 "<SRC> <DST>"（Perl，避免 awk 引号坑） ----------
parse_src_dst_from_subject() {
  perl -ne "
    s/[“”\"]/\'/g;                          # 中文/双引号 → 单引号
    if (/[Mm]erge\\s+branch\\s+'([^']+)'\\s+into\\s+'?([^' ]+)'?/){ print \"\$1 \$2\\n\"; exit }
    if (/[Mm]erge\\s+([^ ]+)\\s+into\\s+([^ ]+)/){ print \"\$1 \$2\\n\"; exit }
    if (/合并分支\\s+'([^']+)'\\s+到\\s+([^ ]+)/){ print \"\$1 \$2\\n\"; exit }
    if (/将\\s+([^ ]+)\\s+合并到\\s+([^ ]+)/){ print \"\$1 \$2\\n\"; exit }
  "
}

# ---------- 自动：扫描日志（取“最早”命中） ----------
find_origin_from_desc() {
  local repo="$1" cur="$2"
  git -C "$repo" log --reverse --pretty=format:'%s' \
  | while IFS= read -r subject; do
      local pair src dst
      pair="$(printf '%s' "$subject" | parse_src_dst_from_subject || true)"
      if [[ -n "$pair" ]]; then
        src="${pair%% *}"; dst="${pair#* }"
        if [[ "$dst" == "$cur" ]]; then print -r -- "$src"; exit 0; fi
      fi
    done
  return 1
}

# ---------- 回退：锚点关键字模式（可用 fzf 选择） ----------
has_fzf() { command -v fzf >/dev/null 2>&1; }

anchor_search() {
  local repo="$1" kw="$2" scope="${3:-fp}" extra=()
  [[ "$scope" == "fp" ]] && extra+=( --first-parent )
  git -C "$repo" log --no-color --date=iso --pretty=format:'%H%x09%ad%x09%s' "${extra[@]}" HEAD | grep -F -- "$kw" || true
}

run_anchor_interactive() {
  local repo="$1" kw=""
  if has_fzf; then
    local subjects; subjects="$(git -C "$repo" log --no-color --pretty=format:'%s' HEAD | awk 'NF' | awk '!seen[$0]++')"
    print -r -- "🔎 选择/输入锚点关键字（fzf，回车确认；Esc 取消）：" > /dev/tty
    kw="$(print -r -- "$subjects" | fzf --ansi --height=80% --reverse --prompt='关键字： ' --header=$'↑↓选择，输入过滤；回车确定')" || kw=""
  fi
  if [[ -z "$kw" ]]; then
    print -r -- "请输入用于匹配提交描述的关键字（例如：JobsBranch@新葡京（蓝）），直接回车退出：" > /dev/tty
    print -n -- "> " > /dev/tty
    IFS= read -r kw < /dev/tty || kw=""
    kw="$(sanitize_path "$kw")"
  fi
  [[ -z "$kw" ]] && { warn_tty "未输入关键字，已跳过。"; return 1; }

  local hits; hits="$(anchor_search "$repo" "$kw" fp)"
  [[ -z "$hits" ]] && hits="$(anchor_search "$repo" "$kw" all)"
  [[ -z "$hits" ]] && { warn_tty "关键字在提交描述中未命中。"; return 1; }

  print -r -- "选择命中：1) 最早（默认）  2) 最近" > /dev/tty
  print -n -- "> " > /dev/tty
  local sel; IFS= read -r sel < /dev/tty || sel=""
  local pick
  if [[ "$sel" == "2" ]]; then pick="$(print -r -- "$hits" | tail -n1)"; else pick="$(print -r -- "$hits" | head -n1)"; fi

  local H D S; IFS=$'\t' read -r H D S <<< "$pick"
  success_tty "锚点命中：$H  $D  $S"
  git -C "$repo" show -s --format=$'哈希: %H\n作者: %an <%ae>\n时间: %ad\n标题: %s' --date=iso "$H" > /dev/tty
  return 0
}

# ---------- 主流程 ----------
main() {
  : > "$LOG_FILE" 2>/dev/null || true
  intro

  info_echo "脚本所在目录：$SCRIPT_DIR"
  export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

  # 1) 让用户选择仓库目录（内部会设置 SCRIPT_DIR 并且 cd -P 进去）
  ask_git_repo "$SCRIPT_DIR"

  # 2) 统一用 SCRIPT_DIR 作为仓库根
  local REPO_DIR="$SCRIPT_DIR"
  local CUR_BRANCH; CUR_BRANCH="$(current_branch_name "$REPO_DIR")"
  info_echo "当前分支：$CUR_BRANCH"

  # 3) 自动推断
  local ORIGIN=""
  if ORIGIN="$(find_origin_from_desc "$REPO_DIR" "$CUR_BRANCH")"; then
    success_echo "推断结果：'$CUR_BRANCH' 可能最初从 '$ORIGIN' 切出（依据 commit 描述）"
    gray_echo "注：自动模式依赖“Merge … into … / 合并…到 …”类语句。"
    highlight_echo "日志：$LOG_FILE"
  else
    warn_echo "自动模式未命中。进入锚点关键字模式。"
    if run_anchor_interactive "$REPO_DIR"; then
      highlight_echo "日志：$LOG_FILE"
    else
      highlight_echo "日志：$LOG_FILE"
      exit 2
    fi
  fi
}

if [[ "${(%):-%x}" == "$0" ]]; then
  main "$@"
fi

