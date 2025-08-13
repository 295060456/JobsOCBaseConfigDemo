#!/bin/zsh

# ✅ 全局变量定义
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_DIR=""
XCODEPROJ=""
PBXPROJ_PATH=""

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
print_description() {
  echo ""
  bold_echo "🛠️ Xcode 工程构建修复脚本"
  info_echo "📌 功能说明："
  note_echo "1️⃣ 自动识别 Flutter 或原生 iOS 工程"
  note_echo "2️⃣ 自动定位 .xcodeproj 工程文件"
  note_echo "3️⃣ 修改 ENABLE_USER_SCRIPT_SANDBOXING = NO"
  echo ""
  read "?👉 按下回车继续执行，或按 Ctrl+C 取消..."
}

# ✅ 自动识别工程路径
resolve_project_path() {
  if [[ -d "$SCRIPT_DIR/ios" && -d "$SCRIPT_DIR/lib" ]]; then
    success_echo "📦 检测到 Flutter 工程，进入 ios 子目录"
    PROJECT_DIR="$SCRIPT_DIR/ios"
  else
    success_echo "📱 当前目录视为原生 iOS 工程"
    PROJECT_DIR="$SCRIPT_DIR"
  fi
}

# ✅ 识别 xcodeproj
find_or_prompt_xcodeproj() {
  XCODEPROJ=$(find "$PROJECT_DIR" -maxdepth 1 -name "*.xcodeproj" | head -n 1)

  if [[ -z "$XCODEPROJ" ]]; then
    error_echo "❌ 未找到 .xcodeproj 文件，请手动拖入"
    read "?🔍 拖入 .xcodeproj 文件后回车：" XCODEPROJ
    XCODEPROJ=${XCODEPROJ%\"}
    XCODEPROJ=${XCODEPROJ#\"}
  fi

  PBXPROJ_PATH="$XCODEPROJ/project.pbxproj"
  if [[ ! -f "$PBXPROJ_PATH" ]]; then
    error_echo "❌ project.pbxproj 文件无效，脚本终止"
    exit 1
  fi
  info_echo "📂 当前工程：$XCODEPROJ"
}

# ✅ 修改 ENABLE 设置字段
patch_sandbox_flag() {
  info_echo "🔍 查找 ENABLE_USER_SCRIPT_SANDBOXING 设置..."

  if grep -q "ENABLE_USER_SCRIPT_SANDBOXING" "$PBXPROJ_PATH"; then
    success_echo "✅ 已存在配置，替换为 NO"
    sed -i '' 's/ENABLE_USER_SCRIPT_SANDBOXING = YES;/ENABLE_USER_SCRIPT_SANDBOXING = NO;/g' "$PBXPROJ_PATH"
    sed -i '' 's/ENABLE_USER_SCRIPT_SANDBOXING = YES/ENABLE_USER_SCRIPT_SANDBOXING = NO/g' "$PBXPROJ_PATH"
  else
    success_echo "➕ 未显式设置，将添加 NO 到所有 buildSettings"
    sed -i '' '/buildSettings = {/a\
\        ENABLE_USER_SCRIPT_SANDBOXING = NO;
' "$PBXPROJ_PATH"
  fi
}

# ✅ 主函数入口
main() {
  clear
  print_description                      # 🖨️ 自述信息
  resolve_project_path                   # 🔍 识别工程路径
  find_or_prompt_xcodeproj               # 🔎 查找或手动输入 .xcodeproj
  patch_sandbox_flag                     # 🛠️ 修改设置
  success_echo "🎉 修复完成，ENABLE_USER_SCRIPT_SANDBOXING 已设置为 NO"
}

main "$@"
