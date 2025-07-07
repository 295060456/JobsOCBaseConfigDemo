#!/bin/zsh

# 打印函数
_JobsPrint() { echo -e "$1$2\033[0m"; }
_JobsPrint_Green() { _JobsPrint "\033[1;32m" "$1"; }
_JobsPrint_Red() { _JobsPrint "\033[1;31m" "$1"; }

# 当前脚本所在目录
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

echo ""
echo "======================================================================"
_JobsPrint_Green "📂 请将需要授权执行权限的文件或目录拖入终端"
echo "👉 支持多个路径，路径可含空格，拖完按回车确认"
echo "👉 如果直接按回车：授权当前目录下所有 .command 文件"
echo "👉 如果输入 yes + 回车：递归授权当前目录下所有子目录中的 .command 文件"
echo "======================================================================"
echo ""

read -r "?📥 拖入路径或输入命令后回车：" input_paths

# === 1. 输入为空：只处理当前目录 ===
if [[ -z "$input_paths" ]]; then
  _JobsPrint_Green "📁 未输入路径，开始授权当前目录下的 .command 文件..."

  files=("$SCRIPT_DIR"/*.command(N))
  if [[ ${#files[@]} -eq 0 ]]; then
    _JobsPrint_Red "❌ 当前目录下没有 .command 文件，退出。"
    exit 1
  fi

  for file in "${files[@]}"; do
    chmod +x "$file" && \
    echo "✅ 授权成功：$file" || \
    _JobsPrint_Red "⚠️ 授权失败：$file"
  done

  echo ""
  _JobsPrint_Green "✅ 当前目录授权完毕！"
  read "?🔚 按回车退出..."
  exit 0
fi

# === 2. 输入为 yes：递归授权 ===
if [[ "$input_paths" == "yes" ]]; then
  echo ""
  _JobsPrint_Green "📂 正在递归查找并授权所有 .command 文件..."

  recursive_files=($(find "$SCRIPT_DIR" -type f -name "*.command"))
  if [[ ${#recursive_files[@]} -eq 0 ]]; then
    _JobsPrint_Red "❌ 没有找到任何 .command 文件，退出。"
    exit 1
  fi

  for file in "${recursive_files[@]}"; do
    chmod +x "$file" && \
    echo "✅ 授权成功：$file" || \
    _JobsPrint_Red "⚠️ 授权失败：$file"
  done

  echo ""
  _JobsPrint_Green "✅ 所有子目录授权完成！"
  read "?🔚 按回车退出..."
  exit 0
fi

# === 3. 拖入路径 ===
echo ""
_JobsPrint_Green "🔧 正在处理拖入的路径："

for raw_path in ${(z)input_paths}; do
  path=${raw_path:a}
  if [[ -e "$path" ]]; then
    chmod +x "$path" && \
    echo "✅ 添加执行权限成功：$path" || \
    _JobsPrint_Red "⚠️ 权限修改失败：$path"
  else
    _JobsPrint_Red "❌ 无效路径：$path"
  fi
done

echo ""
_JobsPrint_Green "🎉 所有路径处理完成！可双击或终端运行这些文件。"
read "?🔚 按回车退出..."
