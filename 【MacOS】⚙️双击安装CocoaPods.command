#!/bin/zsh

### ✅ 全局变量定义
START_TIME=$(date +%s)
LOG_FILE="$HOME/Desktop/Jobs_Installer_$(date +%Y%m%d_%H%M%S).log"
typeset -g HOMEBREW_PATH_M_SERIES="/opt/homebrew"
typeset -g HOMEBREW_PATH_X86="/usr/local"
typeset -g CONFIG_FILES=(".zshrc" ".bash_profile")
typeset -g FZF_PROMPT='👉 请选择操作：'

### ✅ 通用输出方法（带日志记录）
log()  { echo -e "$1" | tee -a "$LOG_FILE" }
info() { log "\033[1;32m$1\033[0m" }
warn() { log "\033[1;33m$1\033[0m" }
err()  { log "\033[1;31m$1\033[0m" }

### ✅ 打印 LOGO
print_logo() {
  info "======================="
  info "     Jobs Installer    "
  info "======================="
}

### ✅ 执行耗时
print_duration() {
  END_TIME=$(date +%s)
  DURATION=$((END_TIME - START_TIME))
  info "⚙️ 脚本总耗时：${DURATION}s"
}

### ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

### ✅ fzf选择菜单
fzf_select() {
  printf "%s\n" "$@" | fzf --prompt="$FZF_PROMPT" --height=15 --reverse
}

### ✅ 备份配置文件
backup_configs() {
  for file in "$HOME/.zshrc" "$HOME/.bash_profile"; do
    [ -f "$file" ] && cp "$file" "$file.bak"
  done
  info "📦 已备份配置文件到 .bak"
}

### ✅ 安装 Homebrew（自动架构判断）
install_homebrew() {
  arch=$(get_cpu_arch)
  if ! command -v brew &>/dev/null; then
    info "🍺 安装 Homebrew ($arch)..."
    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    info "✅ Homebrew 安装完成"
  else
    info "✅ Homebrew 已安装"
  fi
}

### ✅ 安装 fzf（交互选择）
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case $method in
      *Homebrew*) brew install fzf;;
      *Git*)
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
        ;;
      *) err "❌ 取消安装 fzf";;
    esac
  else
    info "✅ fzf 已安装"
  fi
}

### ✅ 安装 Ruby（fzf交互 + 多选项）
install_ruby() {
  method=$(fzf_select "通过 Homebrew 安装 Ruby" "通过 Rbenv 安装 Ruby" "通过 RVM 安装 Ruby")
  case $method in
    *Homebrew*)
      brew install ruby
      echo 'export PATH="$(brew --prefix ruby)/bin:$PATH"' >> ~/.zshrc
      ;;
    *Rbenv*)
      brew install rbenv ruby-build
      echo 'eval "$(rbenv init -)"' >> ~/.zshrc
      eval "$(rbenv init -)"
      rbenv install 3.3.0
      rbenv global 3.3.0
      ;;
    *RVM*)
      \curl -sSL https://get.rvm.io | bash -s stable --ruby
      source ~/.rvm/scripts/rvm
      ;;
    *) err "❌ 未选择安装 Ruby";;
  esac
}

### ✅ 设置 Ruby 镜像源（根据 IP 自动判断）
set_gem_source() {
  COUNTRY=$(curl -s https://ipinfo.io | jq -r '.country')
  if [[ "$COUNTRY" == "CN" ]]; then
    gem sources --remove https://rubygems.org/ 2>/dev/null
    gem sources --add https://gems.ruby-china.com/
    info "🇨🇳 使用 Ruby 中国镜像"
  else
    gem sources --remove https://gems.ruby-china.com/ 2>/dev/null
    gem sources --add https://rubygems.org/
    info "🌐 使用默认 Ruby 镜像"
  fi
  gem sources -l | tee -a "$LOG_FILE"
}

### ✅ 安装 CocoaPods（fzf选择 gem/brew）
install_cocoapods() {
  method=$(fzf_select "通过 gem 安装 CocoaPods" "通过 Homebrew 安装 CocoaPods")
  case $method in
    *gem*)
      sudo gem install cocoapods
      ;;
    *Homebrew*)
      brew install cocoapods
      ;;
    *) err "❌ 未选择安装方式";;
  esac
  pod setup
  info "✅ CocoaPods 安装完成"
  pod --version | tee -a "$LOG_FILE"
}

### ✅ 主流程
main() {
  print_logo
  backup_configs
  install_homebrew
  install_fzf
  install_ruby
  set_gem_source
  install_cocoapods
  print_duration
  info "🎉 所有步骤已完成，安装日志已保存：$LOG_FILE"
}

main
