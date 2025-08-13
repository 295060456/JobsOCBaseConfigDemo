#!/bin/zsh

# ============================================================
# 📜 Git 回退工具：支持 soft/hard/tag/reflog + fzf + 拖入路径
# ============================================================

# ✅ 彩色输出函数
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }        # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }      # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }      # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }      # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }        # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }      # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }      # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }        # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }     # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }     # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }        # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }           # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }           # 🔗 下划线

# ✅ 单行写文件（避免重复写入）
inject_shellenv_block() {
  local file="$1"         # 要写入的文件路径
  local line="$2"         # 要追加的内容

  # 参数校验
  if [[ -z "$file" || -z "$line" ]]; then
    error_echo "❌ 用法错误：inject_shell_line <file> <line>"
    return 1
  fi

  # 若该内容已存在，跳过写入
  if grep -Fq "$line" "$file" 2>/dev/null; then
    info_echo "📌 已存在：$line"
  else
    echo "" >> "$file"
    echo "$line" >> "$file"
    success_echo "✅ 已写入到 $file：$line"
  fi

  # 当前 shell 生效（如果是 export 或 eval 开头的行）
  if [[ "$line" == export* || "$line" == eval* ]]; then
    eval "$line"
    success_echo "🟢 当前终端已生效"
  fi
}

# ✅ 获取 CPU 架构信息
get_cpu_arch() {
  uname -m
}

# ✅ fzf 安装方式选择器
fzf_select() {
  printf "%s\n" "$@" | fzf --prompt="📦 请选择：" --header="👇 请选择操作"
}

# ✅ 安装 Homebrew（芯片架构兼容、含环境注入）
install_homebrew() {
  local arch="$(get_cpu_arch)"                    # 获取当前架构（arm64 或 x86_64）
  local shell_path="${SHELL##*/}"                # 获取当前 shell 名称（如 zsh、bash）
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（arm64）"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    success_echo "✅ Homebrew 安装成功"

    # ==== 注入 shellenv 到对应配置文件（自动生效） ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    inject_shellenv_block "$profile_file" "$shellenv_cmd"

  else
    info_echo "🔄 Homebrew 已安装，正在更新..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    success_echo "✅ Homebrew 已更新"
  fi
}

# ✅ 安装 fzf 工具
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    local method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case "$method" in
      *Homebrew*) brew install fzf ;;
      *Git*) git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all ;;
      *) error_echo "❌ fzf 安装取消"; exit 1 ;;
    esac
  else
    info_echo "🔄 fzf 已安装，升级中..."
    brew upgrade fzf || true
    success_echo "✅ fzf 已是最新版"
  fi
}

# ✅ 判断是否是 Git 仓库
_is_git_repo() {
  [[ -d "$1/.git" ]]
}

# ✅ 获取 Git 仓库路径（支持拖入）
resolve_git_repo_path() {
  while true; do
    local script_dir=$(dirname "$(realpath "$0")")
    if _is_git_repo "$script_dir"; then
      highlight_echo "📁 当前脚本目录是 Git 仓库：$script_dir"
      echo "$script_dir"
      return
    fi
    warn_echo "📂 当前目录不是 Git 仓库，请拖入有效路径："
    read "input_path?👉 拖入路径："
    input_path="${input_path//\"/}"
    local abs_path="$(cd "$input_path" 2>/dev/null && pwd)"
    if [[ -n "$abs_path" && -d "$abs_path" ]] && _is_git_repo "$abs_path"; then
      highlight_echo "📁 已识别 Git 仓库路径：$abs_path"
      echo "$abs_path"
      return
    fi
    error_echo "❌ 路径无效或非 Git 仓库，请重新输入。"
  done
}

# ✅ 检查暂存区是否干净
check_staged_changes() {
  if ! git diff --cached --quiet; then
    warn_echo "⚠️ 暂存区存在更改，请先 git reset 或提交后再执行回退。"
    exit 1
  fi
}

# ✅ 回退到上一提交（支持 soft/hard）
reset_to_previous_commit() {
  local mode=$(fzf_select "soft 回退（保留更改）" "hard 回退（清除所有更改）")
  if [[ "$mode" == *soft* ]]; then
    git reset --soft HEAD^
    success_echo "✅ soft 回退成功"
  elif [[ "$mode" == *hard* ]]; then
    git reset --hard HEAD^
    error_echo "⚠️ hard 回退成功"
  else
    warn_echo "❌ 操作取消"
  fi
}

# ✅ 回退到 tag（可选 soft/hard）
reset_to_tag() {
  local tag=$(git tag | sort -r | fzf --prompt="🏷️ 选择 tag：" --header="👇 可回退的 tag")
  [[ -z "$tag" ]] && warn_echo "❌ 未选择 tag，已取消" && return
  local mode=$(fzf_select "soft 回退到 tag $tag" "hard 回退到 tag $tag")
  if [[ "$mode" == *soft* ]]; then
    git reset --soft "$tag"
    success_echo "✅ 已 soft 回退到 tag: $tag"
  elif [[ "$mode" == *hard* ]]; then
    git reset --hard "$tag"
    error_echo "⚠️ 已 hard 回退到 tag: $tag"
  fi
}

# ✅ 通过 reflog 回退（安全恢复）
reset_to_reflog() {
  local target=$(git reflog --pretty=oneline | fzf --prompt="📜 选择 reflog 记录：" --height=80% \
    --header="👇 Git reflog 历史记录回退" | awk '{print $1}')
  [[ -z "$target" ]] && warn_echo "❌ 未选择记录，已取消" && return
  git reset --soft "$target"
  success_echo "✅ 已 soft 回退到 reflog: $target"
}

# ✅ 模式选择器入口
select_reset_mode() {
  local choice=$(fzf_select \
    "回退到上一提交（soft/hard）" \
    "回退到 tag（按标签选择）" \
    "回退到 reflog 历史记录")

  case "$choice" in
    *上一提交*) reset_to_previous_commit ;;
    *tag*)       reset_to_tag ;;
    *reflog*)    reset_to_reflog ;;
    *) warn_echo "❌ 未选择操作，已取消" ;;
  esac
}

# ✅ 进入 Git 仓库路径
enter_git_repo_dir() {
  local git_root=$(resolve_git_repo_path)  # 🔍 获取用户输入或脚本目录下的 Git 仓库路径
  cd "$git_root" || { error_echo "❌ 进入 Git 仓库失败：$git_root"; exit 1; }  # 📁 切换目录并校验
  success_echo "✅ 当前目录已切换为 Git 仓库：$git_root"
}

# ✅ 自述信息
print_git_reset_intro() {
  clear
  highlight_echo "📌 Git 回退工具（支持 tag/reflog/soft/hard + fzf）"
  highlight_echo "=================================================================="
  note_echo "🧩 支持模式："
  note_echo "  1️⃣ soft/hard 回退到上一提交"
  note_echo "  2️⃣ 回退到 tag（保留/丢弃更改）"
  note_echo "  3️⃣ 回退到 reflog 历史记录（安全）"
  highlight_echo "=================================================================="
  read "confirm?📎 按回车继续（Ctrl+C 退出）："
  echo ""
}

# ✅ 主流程入口函数
main() {
  clear
  print_git_reset_intro   # 自述
  install_homebrew        # 🍺 安装或更新 Homebrew（根据 CPU 架构）
  install_fzf             # 🔍 安装或升级 fzf 工具（交互选择器）
  enter_git_repo_dir      # 📂 获取并进入 Git 仓库路径（支持拖入路径）
  check_staged_changes    # ⚠️ 检查是否存在暂存更改，避免数据冲突
  select_reset_mode       # 🚦 交互式选择 Git 回退模式并执行
}

main "$@"
