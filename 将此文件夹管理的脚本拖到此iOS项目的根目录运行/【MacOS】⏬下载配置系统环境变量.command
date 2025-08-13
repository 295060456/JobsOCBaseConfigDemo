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
  SCRIPT_NAME=$(basename "$0" .command)
  echo ""
  success_echo "🛠️ 脚本功能："
  success_echo "1️⃣ 自动打开 GitHub 项目：https://github.com/295060456/MacEnvVarConfig"
  success_echo "2️⃣ 克隆仓库到本脚本同级目录中，文件夹名称与脚本文件同名：$SCRIPT_NAME"
  echo ""
  read "?👉 按下回车键开始执行，或按 Ctrl+C 取消..."
}

# ✅ 获取目录信息
init_vars() {
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"
  SCRIPT_NAME=$(basename "$0" .command)
  TARGET_DIR="$SCRIPT_DIR/$SCRIPT_NAME"
}

# ✅ 检查已有目录并确认
check_existing_dir() {
  if [[ -d "$TARGET_DIR" ]]; then
    warn_echo "⚠️ 目录已存在：$TARGET_DIR"
    echo -n "❓ 是否要删除已有目录并重新 clone？(y/n): "
    read -r answer
    if [[ "$answer" == "y" ]]; then
      rm -rf "$TARGET_DIR"
      success_echo "✅ 已删除旧目录"
    else
      error_echo "❌ 操作已取消。"
      exit 1
    fi
  fi
}

# ✅ 执行克隆操作
clone_repo() {
  success_echo "📥 开始克隆..."
  git clone https://github.com/295060456/MacEnvVarConfig.git "$TARGET_DIR"

  if [[ $? -eq 0 ]]; then
    success_echo "🎉 克隆成功！路径：$TARGET_DIR"
  else
    error_echo "❌ 克隆失败，请检查网络连接或 GitHub 可访问性。"
  fi
}

# ✅ 主函数入口
main() {
  clear                                 # 清屏美观
  print_intro                           # 自述信息
  init_vars                             # 初始化路径和变量
  check_existing_dir                    # 检查目录是否已存在
  clone_repo                            # 执行克隆操作
}

main "$@"
