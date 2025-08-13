#!/bin/zsh

# ✅ 输出样式与日志配置 ==================================
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ 自述信息
print_intro() {
    clear
    echo ""
    success_echo "📦 本脚本用于切换当前 macOS 用户默认 Shell"
    echo "=================================================================="
    note_echo "1️⃣ 检查并安装 fzf"
    note_echo "2️⃣ 列出所有可用 shell（来自 /etc/shells）"
    note_echo "3️⃣ 通过 fzf 选择目标 shell"
    note_echo "4️⃣ 自动设置为默认登录 shell（chsh -s）"
    echo "=================================================================="
    echo ""
    read "?🔑 按回车开始执行..."
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 Homebrew
install_homebrew() {
  arch=$(get_cpu_arch)
  if ! command -v brew &>/dev/null; then
    _color_echo yellow "🧩 未检测到 Homebrew，正在安装 ($arch)..."
    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败"
        exit 1
      }
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
    fi
    _color_echo green "✅ Homebrew 安装成功"
  else
    _color_echo blue "🔄 Homebrew 已安装，更新中..."
    brew update && brew upgrade && brew cleanup
    _color_echo green "✅ Homebrew 已更新"
  fi
}

# ✅ 自检安装 Homebrew.fzf
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
    _color_echo blue "🔄 fzf 已安装，升级中..."
    brew upgrade fzf
    _color_echo green "✅ fzf 已是最新版"
  fi
}

# ✅ 读取系统支持的 shell
read_available_shells() {
  available_shells=($(grep -E "^/" /etc/shells))
  if [[ ${#available_shells[@]} -eq 0 ]]; then
    error_echo "❌ 无法读取可用 shell"
    exit 1
  fi
}

# ✅ 选择目标 shell
select_shell() {
  echo ""
  info_echo "🎯 请选择你要切换的默认 shell："
  selected_shell=$(printf "%s\n" "${available_shells[@]}" | fzf --prompt="Shell ➜ ")
  if [[ -z "$selected_shell" ]]; then
    error_echo "❌ 未选择 shell，操作取消"
    exit 1
  fi
}

# ✅ 执行 shell 切换
apply_selected_shell() {
  echo ""
  info_echo "🔧 正在切换默认 shell 为：$selected_shell"
  chsh -s "$selected_shell"
  success_echo "当前默认 shell 已更新为："
  dscl . -read ~/ UserShell
}

# ✅ 主函数入口
main() {
  print_intro                      # ✅ 自述信息
  install_homebrew                 # ✅ 自检安装 Homebrew
  install_fzf                      # ✅ 自检安装 Homebrew.fzf
  read_available_shells            # ✅ 获取可用 shell 列表
  select_shell                     # ✅ Homebrew.fzf 选择 shell
  apply_selected_shell             # ✅ 切换并显示结果
  echo ""
  success_echo "🎉 操作完成，建议重新打开终端以生效"
}

main "$@"
