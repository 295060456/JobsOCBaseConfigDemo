#!/bin/zsh
# 该脚本放在工程根目录下运行，无需手动输入路径

# 使用 $HOME 代表当前用户的主目录，工程目录即当前工作目录
PROJECT_DIR="$(pwd)"
USER_HOME="$HOME"

# 预先定义 .app 文件所在的完整路径（请根据实际情况修改 DerivedData 目录后缀）
APP_PATH="${USER_HOME}/Library/Developer/Xcode/DerivedData/FMOnlyH5-dxjnpdwuyccqembprekctjsakccg/Build/Products/Debug-iphoneos/FMOnlyH5.app"

# 1. 检查是否安装 Xcode
if [ ! -d "/Applications/Xcode.app" ]; then
    echo "未检测到 Xcode，请安装后再试。"
    exit 1
fi

# 2. 检查工程目录是否存在（通常脚本在工程目录下运行）
if [ ! -d "$PROJECT_DIR" ]; then
    echo "工程目录不存在，请检查路径：$PROJECT_DIR"
    exit 2
fi

# 3. 检查 .app 文件是否存在
if [ ! -d "$APP_PATH" ]; then
    echo "未找到 .app 文件，请先接入真机并进行打包：$APP_PATH"
    exit 3
fi

# 4. 获取主程序名（去除 .app 后缀）
APP_NAME=$(basename "$APP_PATH" .app)
echo "检测到的程序名：$APP_NAME"

# 5. 创建一个临时工作目录（在工程目录下创建 temp_package 文件夹）
WORK_DIR="${PROJECT_DIR}/temp_package"
mkdir -p "$WORK_DIR"

# 6. 将 .app 文件复制到工作目录中，并保留原文件夹名称
TARGET_APP_FOLDER="${WORK_DIR}/${APP_NAME}.app"
cp -R "$APP_PATH" "$TARGET_APP_FOLDER"
if [ $? -ne 0 ]; then
    echo "拷贝 .app 文件失败，请检查路径和权限。"
    exit 4
fi

# 7. 压缩包含 .app 的文件夹，压缩后生成 APP_NAME.app.zip
cd "$WORK_DIR"
zip -r "${APP_NAME}.app.zip" "${APP_NAME}.app"
if [ $? -ne 0 ]; then
    echo "压缩文件失败。"
    exit 5
fi

# 8. 将 .zip 文件重命名为 .ipa 文件
IPA_FILE="${APP_NAME}.ipa"
mv "${APP_NAME}.app.zip" "$IPA_FILE"
if [ $? -ne 0 ]; then
    echo "重命名为 ipa 文件失败。"
    exit 6
fi

# 9. 将 ipa 文件移动到系统桌面
DESKTOP_DIR="${USER_HOME}/Desktop"
mv "$IPA_FILE" "${DESKTOP_DIR}/${IPA_FILE}"
if [ $? -ne 0 ]; then
    echo "移动 ipa 文件到桌面失败。"
    exit 7
fi

echo "打包成功，ipa 文件位于桌面：${DESKTOP_DIR}/${IPA_FILE}"

# 10. 清理临时工作目录
cd "$PROJECT_DIR"
rm -rf "$WORK_DIR"

exit 0
