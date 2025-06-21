#!/bin/zsh

########## ✅ 彩色输出 ##########
_JobsPrint() { echo "$1$2\033[0m"; }
_JobsPrint_Green() { _JobsPrint "\033[1;32m" "$1"; }
_JobsPrint_Red() { _JobsPrint "\033[1;31m" "$1"; }
_JobsPrint_Yellow() { _JobsPrint "\033[1;33m" "$1"; }
_JobsPrint_Blue() { _JobsPrint "\033[1;34m" "$1"; }

########## ✅ 起始说明 ##########
print_script_purpose() {
  _JobsPrint_Green "🧮 Fastlane 自动配置初始化脚本"
  _JobsPrint_Green "📦 脚本用途："
  _JobsPrint_Green "1️⃣ 自动识别当前是 Flutter 工程还是原生 iOS 工程"
  _JobsPrint_Green "2️⃣ 安装或更新 Homebrew、fzf、fastlane"
  _JobsPrint_Green "3️⃣ 创建并打开 Fastfile 以开始配置自动化流程"
  echo ""
  read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."
}

########## ✅ 路径设置 ##########
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd -P)"
FASTFILE_PATH="$SCRIPT_DIR/fastlane/Fastfile"

########## ✅ 打印 LOGO ##########
jobs_logo() {
  _JobsPrint_Green "======== Jobs Fastlane 初始化脚本 ========"
}

########## ✅ 检测工程类型 ##########
detect_project_type() {
  if [[ -f "$SCRIPT_DIR/pubspec.yaml" && -d "$SCRIPT_DIR/ios" ]]; then
    PROJECT_TYPE="flutter"
    _JobsPrint_Green "🧩 检测到 Flutter 工程"
  elif ls "$SCRIPT_DIR"/*.xcodeproj >/dev/null 2>&1 || ls "$SCRIPT_DIR"/*.xcworkspace >/dev/null 2>&1; then
    PROJECT_TYPE="ios"
    _JobsPrint_Green "📱 检测到原生 iOS 工程"
  else
    PROJECT_TYPE="unknown"
    _JobsPrint_Red "⚠️ 无法识别工程类型（Flutter 或 iOS）"
  fi
}

########## ✅ 写环境变量 PATH ##########
_configure_ruby_path() {
  local path_line='export PATH="/opt/homebrew/bin:$PATH"'
  for f in ".zshrc" ".bash_profile" ".bashrc"; do
    grep -qF "$path_line" "$HOME/$f" 2>/dev/null || echo "$path_line" >> "$HOME/$f"
  done
  source ~/.zshrc ~/.bashrc ~/.bash_profile 2>/dev/null
}

########## ✅ 安装 Homebrew ##########
install_homebrew() {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  _configure_ruby_path
}

check_homebrew() {
  if ! command -v brew &>/dev/null; then
    _JobsPrint_Yellow "🍺 开始安装 Homebrew..."
    install_homebrew
  else
    _JobsPrint_Green "✅ Homebrew 已安装"
    brew update && brew upgrade && brew cleanup
  fi
}

########## ✅ 安装 fzf ##########
install_fzf() {
  _JobsPrint_Yellow "🔧 安装 fzf..."
  brew install fzf
  [ -d "$HOME/.fzf" ] && cd "$HOME/.fzf" && git pull && ./install
}

check_fzf() {
  if ! command -v fzf &>/dev/null; then
    install_fzf
  else
    _JobsPrint_Green "✅ fzf 已安装"
    brew upgrade fzf
  fi
}

########## ✅ 安装 fastlane ##########
install_fastlane() {
  brew install fastlane
  _JobsPrint_Green "✅ fastlane 安装成功"
}

check_fastlane() {
  if ! command -v fastlane &>/dev/null; then
    _JobsPrint_Yellow "🚀 开始安装 fastlane..."
    install_fastlane
  else
    _JobsPrint_Green "✅ fastlane 已安装"
    brew upgrade fastlane
  fi
}

########## ✅ Fastfile 检查与打开 ##########
open_fastfile() {
  mkdir -p "$SCRIPT_DIR/fastlane"

  if [[ ! -f "$FASTFILE_PATH" ]]; then
    _JobsPrint_Yellow "📄 未检测到 Fastfile，是否要创建？"
    read "?👉 输入 y 创建，其他键跳过： " init_ans
    if [[ "$init_ans" == "y" ]]; then
      echo "# lane :beta do\n#   build_app\n# end" > "$FASTFILE_PATH"
      _JobsPrint_Green "✅ Fastfile 创建成功: $FASTFILE_PATH"
    fi
  fi

  if [[ -f "$FASTFILE_PATH" ]]; then
    _JobsPrint_Green "🧠 请选择用哪个编辑器打开 Fastfile："
    local editor=$(echo -e "Xcode\nVSCode\nAndroid Studio" | fzf --prompt="🎨 选择编辑器: " --height=10 --reverse)

    case $editor in
      "Xcode") open -a Xcode "$FASTFILE_PATH" ;;
      "VSCode") code "$FASTFILE_PATH" ;;
      "Android Studio") open -a "Android Studio" "$FASTFILE_PATH" ;;
      *) _JobsPrint_Yellow "⚠️ 未选择编辑器，跳过打开" ;;
    esac
  fi
}

########## ✅ 主流程 ##########
print_script_purpose
jobs_logo
detect_project_type
check_homebrew
check_fzf
check_fastlane
open_fastfile
