#!/bin/zsh

# ✅ 日志与彩色输出
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
print_intro() {
  echo ""
  bold_echo "===================================================================="
  error_echo "🧨 脚本功能说明："
  success_echo "✔ 完整卸载 Homebrew（包括 Intel / M 系统安装路径）"
  success_echo "✔ 删除所有 Homebrew 缓存、软件、配置路径"
  success_echo "✔ 修复残留 Git HEAD 错误问题"
  bold_echo "===================================================================="
  echo ""
}

# ✅ 用户确认操作
confirm_uninstall() {
  read "?⚠️ 确定要卸载 Homebrew？请输入 yes 开始执行： " confirm
  if [[ "$confirm" != "yes" ]]; then
    warn_echo "已取消卸载操作"
    exit 0
  fi
}

# ✅ 执行卸载操作
uninstall_homebrew() {
  info_echo "正在卸载 Homebrew..."

  # ---------- 1. 尝试 cleanup ----------
  brew cleanup || true

  # ---------- 2. 官方卸载脚本 ----------
  gray_echo "🔄 执行官方卸载脚本..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

  # ---------- 3. 手动删除常见路径 ----------
  gray_echo "🗑️ 清理常见安装目录..."
  local paths_to_remove=(
    /usr/local/Caskroom/
    /usr/local/Frameworks/
    /usr/local/Homebrew/
    /usr/local/bin/
    /usr/local/etc/
    /usr/local/include/
    /usr/local/lib/
    /usr/local/opt/
    /usr/local/sbin/
    /usr/local/share/
    /usr/local/var/
    /opt/homebrew/
  )
  for path in "${paths_to_remove[@]}"; do
    sudo rm -rf "$path"
  done

  # ---------- 4. 修复 Git HEAD 错误 ----------
  gray_echo "🔧 检查并修复 Git HEAD 错误..."
  local brew_repo
  brew_repo=$(brew --repo homebrew/core 2>/dev/null || true)
  if [[ -n "$brew_repo" ]]; then
    sudo rm -rf "$brew_repo"
  fi

  success_echo "🎉 Homebrew 已彻底卸载完成"
}

# ✅ 主函数入口
main() {
  clear                      # 清空终端内容，使输出更整洁
  print_intro                # 自述信息
  confirm_uninstall          # 等待用户输入确认是否执行卸载操作（必须输入 yes）
  uninstall_homebrew         # 执行 Homebrew 卸载和残留路径清理操作
}

main "$@"
