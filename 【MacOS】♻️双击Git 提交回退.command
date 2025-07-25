#!/bin/bash

# ===============================
# 📜 Git 提交回退脚本（支持 fzf 选择回退方式 + 拖入目录判断）
# ===============================

# ========== 彩色输出函数 ==========
_color_echo() {
  local color="$1"; shift
  local text="$*"
  case "$color" in
    red)    printf "\033[31m%s\033[0m\n" "$text" ;;
    green)  printf "\033[32m%s\033[0m\n" "$text" ;;
    yellow) printf "\033[33m%s\033[0m\n" "$text" ;;
    blue)   printf "\033[34m%s\033[0m\n" "$text" ;;
    *)      printf "%s\n" "$text" ;;
  esac
}

# ========== Homebrew 和 fzf 自检 ==========
_check_homebrew_and_fzf() {
  if ! command -v brew >/dev/null 2>&1; then
    _color_echo red "❌ 未安装 Homebrew，正在安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
  fi
  if ! command -v fzf >/dev/null 2>&1; then
    _color_echo yellow "🔍 未检测到 fzf，正在安装..."
    brew install fzf
  else
    _color_echo blue "🔄 fzf 已安装，正在尝试升级..."
    brew upgrade fzf || true
  fi
}

# ========== 判断是否是 Git 仓库 ==========
_is_git_repo() {
  [[ -d "$1/.git" ]]
}

# ========== 自述 ==========
echo "📌 当前功能：Git 回退操作（交互选择模式）"
echo "------------------------------------------------------------"
echo "✔️ 1. 回退到上一次提交（保留更改到暂存区）"
echo "⚠️ 2. 强制回退（丢弃所有未提交的更改）"
echo "------------------------------------------------------------"
read -p "📎 按回车开始执行（或 Ctrl+C 退出）：" _

# ========== 安装依赖 ==========
_check_homebrew_and_fzf

# ========== 获取有效 Git 项目路径 ==========
while true; do
  script_dir=$(dirname "$(realpath "$0")")
  if _is_git_repo "$script_dir"; then
    git_root="$script_dir"
    break
  else
    _color_echo yellow "📂 当前路径不是 Git 项目，请拖入正确的 Git 仓库目录："
    read -r input_path
    input_path="${input_path//\"/}"  # 去除双引号
    abs_path="$(cd "$input_path" 2>/dev/null && pwd)"
    if [[ -n "$abs_path" && -d "$abs_path" ]] && _is_git_repo "$abs_path"; then
      git_root="$abs_path"
      break
    fi
    _color_echo red "❌ 无效路径或不是 Git 仓库，请重新拖入。"
  fi
done

cd "$git_root" || exit 1

# ========== 检查暂存区是否为空 ==========
if ! git diff --cached --quiet; then
  _color_echo yellow "⚠️ 检测到已有暂存更改，请先取消暂存（git reset）或提交后再回退。"
  exit 1
fi

# ========== fzf 交互选择回退方式 ==========
reset_mode=$(printf "回退到上一次提交（保留更改到暂存区）\n强制回退到上一次提交（丢弃所有更改）" | \
  fzf --prompt="请选择回退方式：" --header="👇 请选择 Git 回退模式（回车确认）")

if [[ "$reset_mode" == "回退到上一次提交（保留更改到暂存区）" ]]; then
  git reset --soft HEAD^
  _color_echo green "✅ 已回退到上一提交（soft），更改保留在暂存区。"
elif [[ "$reset_mode" == "强制回退到上一次提交（丢弃所有更改）" ]]; then
  git reset --hard HEAD^
  _color_echo red "⚠️ 已强制回退（hard），所有未提交更改已清除。"
else
  _color_echo yellow "❌ 未选择任何操作，已取消。"
fi
