#!/bin/zsh

print_green()  { echo "\033[0;32m$1\033[0m"; }
print_red()    { echo "\033[0;31m$1\033[0m"; }
print_yellow() { echo "\033[0;33m$1\033[0m"; }

print_green "🛠️ 脚本功能："
echo "1️⃣ 自动识别 Flutter 或原生 iOS 工程"
echo "2️⃣ 自动定位 Xcode 工程（.xcodeproj）文件"
echo "3️⃣ 修改 ENABLE_USER_SCRIPT_SANDBOXING = NO，防止 CocoaPods 构建失败"
echo ""

SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
XCODEPROJ=""

# 尝试自动识别 Flutter / iOS 工程路径
if [[ -d "$SCRIPT_DIR/ios" && -d "$SCRIPT_DIR/lib" ]]; then
  print_green "📦 检测到 Flutter 工程，进入 ios 子目录查找 Xcode 工程..."
  PROJECT_DIR="$SCRIPT_DIR/ios"
else
  print_green "📱 尝试在当前目录查找原生 iOS 工程..."
  PROJECT_DIR="$SCRIPT_DIR"
fi

# 自动寻找 .xcodeproj
XCODEPROJ=$(find "$PROJECT_DIR" -maxdepth 1 -name "*.xcodeproj" | head -n 1)

# 如果找不到，就让用户手动拖入
if [[ -z "$XCODEPROJ" ]]; then
  print_red "❌ 未自动找到 .xcodeproj 文件"
  echo ""
  read "?👉 请手动拖入你的 .xcodeproj 工程文件，然后按回车：" XCODEPROJ
  XCODEPROJ=${XCODEPROJ%\"}
  XCODEPROJ=${XCODEPROJ#\"}
fi

# 校验路径有效性
PBXPROJ_PATH="$XCODEPROJ/project.pbxproj"
if [[ ! -f "$PBXPROJ_PATH" ]]; then
  print_red "❌ 找不到 project.pbxproj 文件，请确认路径正确"
  exit 1
fi

print_yellow "📂 目标工程：$XCODEPROJ"
print_green  "🔍 正在查找 ENABLE_USER_SCRIPT_SANDBOXING 设置..."

# ✅ 若已存在，则替换为 NO
grep -q "ENABLE_USER_SCRIPT_SANDBOXING" "$PBXPROJ_PATH"
if [[ $? -eq 0 ]]; then
  print_green "✅ 已找到 ENABLE_USER_SCRIPT_SANDBOXING，正在替换为 NO..."
  sed -i '' 's/ENABLE_USER_SCRIPT_SANDBOXING = YES;/ENABLE_USER_SCRIPT_SANDBOXING = NO;/g' "$PBXPROJ_PATH"
  sed -i '' 's/ENABLE_USER_SCRIPT_SANDBOXING = YES/ENABLE_USER_SCRIPT_SANDBOXING = NO/g' "$PBXPROJ_PATH"
else
  print_green "➕ 未显式设置，添加 ENABLE_USER_SCRIPT_SANDBOXING = NO 到所有 buildSettings..."
  sed -i '' '/buildSettings = {/a\
\        ENABLE_USER_SCRIPT_SANDBOXING = NO;
' "$PBXPROJ_PATH"
fi

print_green "🎉 修改完成！已将 ENABLE_USER_SCRIPT_SANDBOXING 设置为 NO"
