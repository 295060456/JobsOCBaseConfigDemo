#!/bin/zsh

# 获取当前脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_FILE="$SCRIPT_DIR/PostData.json"

# 定义重置内容
RESET_CONTENT='{
  "posts": []
}'

# 写入内容
echo "$RESET_CONTENT" > "$TARGET_FILE"

# 打印结果
if [[ $? -eq 0 ]]; then
  echo "✅ 已成功重置 PostData.json 内容为："
  echo "$RESET_CONTENT"
else
  echo "❌ 写入失败，请检查文件权限或路径是否正确。"
fi
