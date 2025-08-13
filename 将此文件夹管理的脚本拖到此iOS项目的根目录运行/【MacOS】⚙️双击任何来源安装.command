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
print_intro() {
  echo ""
  info_echo  "=============================="
  info_echo  "   Jobs Gatekeeper 解锁器 🛡️ "
  info_echo  "=============================="
  echo ""
  info_echo "📌 本脚本用于启用 macOS 的『任何来源』安装权限。"
  echo ""
  warn_echo "⚠ macOS 13+ 需先关闭 SIP（系统完整性保护）后才能启用。"
  echo ""
  success_echo "✔ 如果你尚未关闭 SIP，请重启进入『恢复模式』执行："
  echo "   csrutil disable"
  echo ""
  gray_echo "✅ 验证方式：正常进入系统后，终端执行：csrutil status"
  gray_echo "👉 应输出：System Integrity Protection status: disabled."
  echo ""
}

# ✅  用户确认继续执行
wait_for_confirmation() {
  read "?⏳ 按下回车继续执行脚本（将先检查是否已关闭 SIP）..."
}

# ✅ 检查 SIP 状态
check_sip_status() {
  SIP_STATUS=$(csrutil status 2>/dev/null)
  if [[ "$SIP_STATUS" != *"disabled"* ]]; then
    error_echo "❌ 当前 SIP 尚未关闭，不能启用『任何来源』。"
    echo ""
    warn_echo "请根据提示进入恢复模式，执行：csrutil disable 后再运行本脚本。"
    echo ""
    exit 1
  fi
  success_echo "✅ 检测通过，SIP 已关闭"
}

# ✅ 启用“任何来源”权限
enable_anywhere_permission() {
  info_echo "🔧 正在启用『任何来源』安装权限..."
  echo ""
  sudo spctl --master-disable
}

# ✅ 打开系统设置
open_system_setting() {
  echo ""
  success_echo "✅ 命令执行完毕。请前往：系统设置 > 隐私与安全性"
  info_echo    "👉 向下滚动，点击「允许来自任何来源」确认该设置。"
  echo ""
  read "?⏳ 按下回车后将自动打开系统设置..."
  open "x-apple.systempreferences:com.apple.preference.security?Privacy"
  echo ""
  info_echo "🍎 完成！确认设置后，你即可安装任何第三方来源软件。"
}

# ✅ 主函数
main() {
  clear                                      # 🧹 清空终端界面，保持输出整洁
  print_intro                                # 🖨️ 自述信息
  wait_for_confirmation                      # ⏸️ 等待用户回车确认继续执行
  check_sip_status                           # ✅ 检查是否已关闭 SIP（系统完整性保护）
  enable_anywhere_permission                 # 🔓 启用「任何来源」安装权限
  open_system_setting                        # ⚙️ 打开系统设置供用户确认
}

main "$@"
