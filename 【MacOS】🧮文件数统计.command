#!/bin/zsh

# 主动等待用户输入路径
if [[ -z "$1" ]]; then
  echo "📂 请拖入一个文件夹路径后回车："
  read FOLDER_PATH
else
  FOLDER_PATH="$1"
fi

# 检查路径是否合法
if [[ ! -d "$FOLDER_PATH" ]]; then
  echo "❌ 路径无效或不是文件夹: $FOLDER_PATH"
  exit 1
fi

# 初始化总文件计数器
TOTAL_FILE_COUNT=0

# 递归函数
function scan_folder() {
  local folder="$1"
  local indent="$2"
  local subdirs=()
  local files=()

  for item in "$folder"/*; do
    [[ -e "$item" ]] || continue
    if [[ -d "$item" ]]; then
      subdirs+=("$item")
    elif [[ -f "$item" ]]; then
      files+=("$item")
    fi
  done

  local file_count=${#files[@]}
  echo "${indent}📁 $(basename "$folder") - $file_count 个文件"
  TOTAL_FILE_COUNT=$((TOTAL_FILE_COUNT + file_count))

  for subdir in "${subdirs[@]}"; do
    scan_folder "$subdir" "  $indent"
  done
}

echo "📊 文件夹报告：$FOLDER_PATH"
echo "==========================="
scan_folder "$FOLDER_PATH" ""
echo "==========================="
echo "📦 总文件数：$TOTAL_FILE_COUNT 个"

# 等待用户按任意键后关闭窗口
echo "\n✅ 回车退出..."
read
