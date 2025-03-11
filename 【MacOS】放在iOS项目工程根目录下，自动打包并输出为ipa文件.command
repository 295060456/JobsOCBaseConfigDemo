#!/bin/zsh
# 该脚本放在 Xcode 工程根目录下运行

# 1. 获取当前工程目录和用户主目录
PROJECT_DIR="$(pwd)"
USER_HOME="$HOME"

# 2. 获取 Xcode 工程名（去除 .xcodeproj 后缀）
PROJECT_NAME=$(basename "$(find . -maxdepth 1 -name '*.xcodeproj' | head -n 1)" .xcodeproj)
if [ -z "$PROJECT_NAME" ]; then
    echo "未找到 .xcodeproj 文件，请确保脚本放在 Xcode 工程根目录下。"
    exit 1
fi

# 3. 预先定义 .app 文件所在的完整路径（请根据实际情况修改 DerivedData 目录后缀）
APP_PATH="${USER_HOME}/Library/Developer/Xcode/DerivedData/${PROJECT_NAME}-*/Build/Products/Debug-iphoneos/${PROJECT_NAME}.app"

# 查找 .app 真实路径
APP_PATH=$(find "${USER_HOME}/Library/Developer/Xcode/DerivedData" -type d -path "*/Build/Products/Debug-iphoneos/${PROJECT_NAME}.app" | head -n 1)

if [ ! -d "$APP_PATH" ]; then
    echo "未找到 .app 文件，请先接入真机并进行打包：$APP_PATH"
    exit 2
fi

echo "检测到 .app 路径：$APP_PATH"

# 4. 创建 Payload 目录
WORK_DIR="${PROJECT_DIR}/Payload"
mkdir -p "$WORK_DIR"

# 5. 复制 .app 文件到 Payload 目录
cp -R "$APP_PATH" "$WORK_DIR/"
if [ $? -ne 0 ]; then
    echo "拷贝 .app 文件失败，请检查路径和权限。"
    exit 3
fi

# 6. 压缩 Payload 文件夹
cd "$PROJECT_DIR"
IPA_FILE="${PROJECT_NAME}.ipa"
zip -r "$IPA_FILE" "Payload"
if [ $? -ne 0 ]; then
    echo "压缩文件失败。"
    exit 4
fi

# 7. 移动 .ipa 文件到桌面
DESKTOP_DIR="${USER_HOME}/Desktop"
mv "$IPA_FILE" "${DESKTOP_DIR}/${IPA_FILE}"
if [ $? -ne 0 ]; then
    echo "移动 ipa 文件到桌面失败。"
    exit 5
fi

echo "打包成功，ipa 文件位于桌面：${DESKTOP_DIR}/${IPA_FILE}"

# 8. 清理 Payload 目录
rm -rf "$WORK_DIR"

exit 0
