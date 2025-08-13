#!/bin/zsh

# ✅ 全局变量定义
START_TIME=$(date +%s)
LOG_FILE="$HOME/Desktop/Jobs_Installer_$(date +%Y%m%d_%H%M%S).log"

typeset -g HOMEBREW_PATH_M_SERIES="/opt/homebrew"
typeset -g HOMEBREW_PATH_X86="/usr/local"
typeset -g CONFIG_FILES=(".zshrc" ".bash_profile")
typeset -g FZF_PROMPT='👉 请选择操作：'

# ✅ 彩色输出函数（带日志）
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

# ✅ 打印 LOGO
print_logo() {
  highlight_echo "======================="
  highlight_echo "     Jobs Installer    "
  highlight_echo "======================="
}

# ✅ 打印耗时
print_duration() {
  END_TIME=$(date +%s)
  DURATION=$((END_TIME - START_TIME))
  info_echo "⚙️ 脚本总耗时：${DURATION}s"
}

# ✅ 获取 CPU 架构
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ fzf 菜单选择器
fzf_select() {
  printf "%s\n" "$@" | fzf --prompt="$FZF_PROMPT" --height=15 --reverse
}

# ✅ 备份配置文件
backup_configs() {
  for file in "$HOME/.zshrc" "$HOME/.bash_profile"; do
    [[ -f "$file" ]] && cp "$file" "$file.bak"
  done
  success_echo "📦 已备份配置文件到 .bak"
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 安装 Homebrew（芯片架构兼容、含环境注入）
install_homebrew() {
  local arch="$(get_cpu_arch)"
  local shell_path="${SHELL##*/}"
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    _color_echo yellow "🧩 未检测到 Homebrew，正在安装 ($arch)..."

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    _color_echo green "✅ Homebrew 安装成功"

    # ==== 设置 brew 环境 ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""
    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    # 避免重复写入
    if grep -qF "$shellenv_cmd" "$profile_file" 2>/dev/null; then
      _color_echo blue "🔁 brew shellenv 已存在于 $profile_file，无需重复添加"
    else
      echo "$shellenv_cmd" >> "$profile_file"
      _color_echo green "📝 已写入 brew shellenv 到 $profile_file"
    fi

    # 当前会话立即生效
    eval "$shellenv_cmd"
    _color_echo green "✅ brew 环境变量已在当前终端生效"

  else
    _color_echo blue "🔄 Homebrew 已安装，更新中..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    _color_echo green "✅ Homebrew 已更新"
  fi
}

# ✅ 安装 fzf（支持交互）
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case $method in
      *Homebrew*) brew install fzf ;;
      *Git*)
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all ;;
      *) error_echo "❌ 取消安装 fzf" ;;
    esac
  else
    success_echo "✅ fzf 已安装"
  fi
}

# ✅ 安装 Ruby（多方式）
install_ruby() {
  method=$(fzf_select "通过 Homebrew 安装 Ruby" "通过 Rbenv 安装 Ruby" "通过 RVM 安装 Ruby")
  case $method in
    *Homebrew*)
      brew install ruby
      echo 'export PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc ;;
    *Rbenv*)
      brew install rbenv ruby-build
      echo 'eval "$(rbenv init -)"' >> ~/.zshrc
      eval "$(rbenv init -)"
      rbenv install 3.3.0
      rbenv global 3.3.0 ;;
    *RVM*)
      \curl -sSL https://get.rvm.io | bash -s stable --ruby
      source ~/.rvm/scripts/rvm ;;
    *) error_echo "❌ 未选择安装 Ruby" ;;
  esac
}

# ✅ 设置 Ruby 镜像源（IP 判断）
is_in_china() {
  local country
  country=$(curl -s --max-time 3 https://ipinfo.io | jq -r '.country' 2>/dev/null)

  if [[ "$country" == "CN" ]]; then
    return 0  # 是中国，true
  else
    return 1  # 不是中国，false
  fi
}

set_gem_source() {
  if is_in_china; then
    gem sources --remove https://rubygems.org/ 2>/dev/null
    gem sources --add https://gems.ruby-china.com/ 2>/dev/null
    note_echo "🇨🇳 当前在中国，已切换为 Ruby 中国镜像源"
  else
    gem sources --remove https://gems.ruby-china.com/ 2>/dev/null
    gem sources --add https://rubygems.org/ 2>/dev/null
    note_echo "🌐 当前不在中国，已切换为官方 Ruby 镜像源"
  fi

  info_echo "📦 当前 RubyGem 源列表："
  gem sources -l | tee -a "$LOG_FILE"
}

# ✅ 安装 CocoaPods（gem/brew）
install_cocoapods() {
  method=$(fzf_select "通过 gem 安装 CocoaPods" "通过 Homebrew 安装 CocoaPods")
  case $method in
    *gem*) sudo gem install cocoapods ;;
    *Homebrew*) brew install cocoapods ;;
    *) error_echo "❌ 未选择安装方式" ;;
  esac
  pod setup
  success_echo "✅ CocoaPods 安装完成"
  pod --version | tee -a "$LOG_FILE"
}

# ✅ 主流程入口
main() {
  print_logo                # 🎨 打印脚本头部 Logo
  backup_configs            # 🛡️ 备份 zshrc / bash_profile
  install_homebrew          # 🍺 自动安装 Homebrew（芯片架构兼容、含环境注入）
  install_fzf               # 🔍 安装 fzf（支持 git/homebrew 二选）
  install_ruby              # 💎 Ruby 安装（Homebrew / rbenv / RVM）
  set_gem_source            # 🌐 根据 IP 判断并设置 gem 源
  install_cocoapods         # 📦 安装 CocoaPods（gem/brew 二选）
  print_duration            # ⏱️ 打印脚本耗时
  success_echo "🎉 所有步骤已完成，安装日志保存在：$LOG_FILE"
}

main "$@"
