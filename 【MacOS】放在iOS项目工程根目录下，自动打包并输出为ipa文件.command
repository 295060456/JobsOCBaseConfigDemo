#!/bin/zsh

# 获取脚本所在目录
CURRENT_DIR=$(cd "$(dirname "$0")" && pwd)
echo "📂 当前目录: $CURRENT_DIR"

# 获取当前目录下的 .xcodeproj 文件名（不含扩展名）
PROJECT_NAME=$(find "$CURRENT_DIR" -maxdepth 1 -name "*.xcodeproj" | head -n 1 | sed 's|.*/||; s|\.xcodeproj$||')
if [[ -z "$PROJECT_NAME" ]]; then
    echo "❌ 未找到 .xcodeproj 文件，请确保在正确的目录运行此脚本"
    exit 1
fi

echo "✅ 发现 Xcode 项目: $PROJECT_NAME"

# 获取当前用户名
USER_NAME=$(whoami)

# 确定 DerivedData 目录中的 .app 路径
APP_PATH="/Users/$USER_NAME/Library/Developer/Xcode/DerivedData/${PROJECT_NAME}-*/Build/Products/Debug-iphoneos/${PROJECT_NAME}.app"
RESOLVED_APP_PATH=$(eval echo $APP_PATH | head -n 1)
if [[ ! -d "$RESOLVED_APP_PATH" ]]; then
    echo "❌ 未找到 .app 文件，请确认路径是否正确: $RESOLVED_APP_PATH"
    exit 1
fi

echo "✅ 找到 .app 文件: $RESOLVED_APP_PATH"

# 生成桌面 Payload 文件夹
DESKTOP_PATH="/Users/$USER_NAME/Desktop"
PAYLOAD_PATH="$DESKTOP_PATH/Payload"
IPA_PATH="$DESKTOP_PATH/$PROJECT_NAME.ipa"

if [[ -d "$PAYLOAD_PATH" ]]; then
    echo "⚠️ 发现已有 Payload 目录，正在清空..."
    rm -rf "$PAYLOAD_PATH"
fi
mkdir "$PAYLOAD_PATH"
echo "✅ 创建 Payload 文件夹"

# 复制 .app 到 Payload
cp -R "$RESOLVED_APP_PATH" "$PAYLOAD_PATH"
echo "✅ 复制 .app 到 Payload"

# 压缩成 .ipa
cd "$DESKTOP_PATH"
zip -r "$PROJECT_NAME.ipa" Payload > /dev/null
rm -rf "$PAYLOAD_PATH"
echo "✅ 打包完成: $IPA_PATH"
