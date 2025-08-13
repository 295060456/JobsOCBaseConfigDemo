#!/bin/zsh

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

# ✅ 自述信息
print_banner() {
  echo ""
  highlight_echo "===================================================================="
  highlight_echo "🧰 脚本功能说明："
  success_echo "✔ 自动安装或更新 Homebrew"
  success_echo "✔ 环境变量统一写入 ~/.bash_profile（不写入 zprofile）"
  success_echo "✔ 安装 34 个常用开发工具（自动跳过废弃项）"
  highlight_echo "===================================================================="
  echo ""
  read "?👉 请按下回车继续执行，或按 Ctrl+C 取消..."
}

# ✅ 单行写文件（避免重复写入）
inject_shellenv_block() {
    local id="$1"           # 参数1：环境变量块 ID，如 "homebrew_env"
    local shellenv="$2"     # 参数2：实际要写入的 shellenv 内容，如 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    local header="# >>> ${id} 环境变量 >>>"  # 自动生成注释头

    # 参数校验
    if [[ -z "$id" || -z "$shellenv" ]]; then
    error_echo "❌ 缺少参数：inject_shellenv_block <id> <shellenv>"
    return 1
    fi

    # 若用户未选择该 ID，则跳过写入
    if [[ ! " ${selected_envs[*]} " =~ " $id " ]]; then
    warn_echo "⏭️ 用户未选择写入环境：$id，跳过"
    return 0
    fi

    # 避免重复写入
    if grep -Fq "$header" "$PROFILE_FILE"; then
      info_echo "📌 已存在 header：$header"
    elif grep -Fq "$shellenv" "$PROFILE_FILE"; then
      info_echo "📌 已存在 shellenv：$shellenv"
    else
      echo "" >> "$PROFILE_FILE"
      echo "$header" >> "$PROFILE_FILE"
      echo "$shellenv" >> "$PROFILE_FILE"
      success_echo "✅ 已写入：$header"
    fi

    # 当前 shell 生效
    eval "$shellenv"
    success_echo "🟢 shellenv 已在当前终端生效"
}

# ✅ 写入 brew 环境变量配置
write_brew_env_to_bash_profile() {
  local brew_env_output=$(eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)")
  if ! grep -q "brew shellenv" "$HOME/.bash_profile"; then
    echo "$brew_env_output" >> "$HOME/.bash_profile"
    success_echo "✔ 已写入 brew 环境变量到 ~/.bash_profile"
  else
    info_echo "ℹ ~/.bash_profile 中已包含 brew 配置，无需重复写入"
  fi
  eval "$brew_env_output"
  source "$HOME/.bash_profile"
  open "$HOME/.bash_profile"
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
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

# ✅ 安装开发工具集
install_dev_tools() {
  echo ""
  info_echo "📦 开始安装常用软件包和工具（共计 34 项）"
  warn_echo "⚠️ 『cakebrew』『launchrocket』为废弃软件，已跳过安装"

  local packages=(
    docker carthage php mysql tomcat maven java node nvm python3 openssl
    wget heroku git autojump mongodb nginx iterm2 xz pkg-config readline
    coreutils lrzsz clang-format git-flow curl ffmpeg watchman gnupg oclint
    yarn ruby
  )

  for pkg in "${packages[@]}"; do
    brew install "$pkg"
  done

  brew install --cask flutter
  brew cleanup

  echo ""
  success_echo "🎉 所有开发工具安装完成！"
}

# ✅ 主流程入口
main() {
  print_banner               # 🎯 自述信息
  install_homebrew           # 🍺 安装或更新 Homebrew
  install_dev_tools          # 📦 安装常用工具合集
}

main "$@"
