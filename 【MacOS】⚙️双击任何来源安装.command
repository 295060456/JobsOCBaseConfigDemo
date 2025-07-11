#!/bin/zsh

# ========== 彩色输出 ==========
_red()    { echo "\033[1;31m$1\033[0m"; }
_green()  { echo "\033[1;32m$1\033[0m"; }
_yellow() { echo "\033[1;33m$1\033[0m"; }
_blue()   { echo "\033[1;34m$1\033[0m"; }

# ========== 开始自述 ==========
echo ""
_blue "🛡️ 本脚本用于启用 macOS 的「任何来源」安装权限。"
echo ""
_yellow "⚠️ 注意：macOS 13 及以上系统需先关闭 SIP（系统完整性保护），"
_yellow "否则将无法启用“任何来源”，系统设置中也不会显示该选项。"
echo ""
_green "✔️ 如果你尚未关闭 SIP，请立即重启 Mac 并进入『恢复模式』关闭："
echo ""
echo "Intel 芯片：关机后开机时按住 ⌘ + R 直到进入恢复模式"
echo "M 系芯片：关机 → 长按电源键直到出现“选项” → 选择“选项”并继续"
echo ""
echo "进入恢复模式后，点击顶部菜单：工具 > 终端，执行："
echo "  csrutil disable"
echo "然后重启回系统。"
echo ""
_green "👉 验证方式："
echo "在系统正常启动后，终端执行："
echo "  csrutil status"
echo "输出应为：System Integrity Protection status: disabled."
echo ""
read "?⏳ 请按下回车继续执行脚本（将先检查是否已关闭 SIP）..."

# ========== 检查 SIP 是否关闭 ==========
SIP_STATUS=$(csrutil status 2>/dev/null)

if [[ "$SIP_STATUS" != *"disabled"* ]]; then
  _red "❌ 当前 SIP 尚未关闭，不能启用「任何来源」。"
  echo ""
  _yellow "请根据上面提示重启进入恢复模式，执行：csrutil disable 后再运行本脚本。"
  echo ""
  exit 1
fi

# ========== 执行开启「任何来源」 ==========
echo ""
_blue "🔧 检测通过，SIP 已关闭。正在启用「任何来源」安装权限..."
echo ""
sudo spctl --master-disable

echo ""
_green "✅ 命令执行完毕。请立即前往：系统设置 > 隐私与安全性，"
echo "👉 向下滚动，点击「允许来自任何来源」确认此更改。"
echo ""
read "?⏳ 按下回车后将自动打开系统设置..."

# 打开系统设置
open "x-apple.systempreferences:com.apple.preference.security?Privacy"

echo ""
_blue "🍎 完成！确认设置后，你即可安装任何第三方来源的软件包。"
