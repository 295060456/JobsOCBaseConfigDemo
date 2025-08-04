#!/bin/zsh

# ✅ 日志与彩色输出
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
  echo "======================================================================"
  success_echo "📂 请将需要授权执行权限的文件或目录拖入终端"
  echo "👉 支持多个路径，路径可含空格，拖完按回车确认"
  echo "👉 如果直接按回车：授权当前目录下所有 .command 文件"
  echo "👉 如果输入 yes + 回车：递归授权当前目录下所有子目录中的 .command 文件"
  echo "======================================================================"
  echo ""
}

# ✅ 默认目录授权
authorize_current_dir() {
  local files=("$SCRIPT_DIR"/*.command(N))
  if [[ ${#files[@]} -eq 0 ]]; then
    error_echo "❌ 当前目录下没有 .command 文件，退出。"
    exit 1
  fi

  success_echo "📁 未输入路径，开始授权当前目录下的 .command 文件..."
  for file in "${files[@]}"; do
    chmod +x "$file" && success_echo "授权成功：$file" || error_echo "授权失败：$file"
  done

  echo ""
  success_echo "✅ 当前目录授权完毕！"
  read "?🔚 按回车退出..."
  exit 0
}

# ✅ 递归目录授权
authorize_recursively() {
  success_echo "📂 正在递归查找并授权所有 .command 文件..."
  local recursive_files=($(find "$SCRIPT_DIR" -type f -name "*.command"))

  if [[ ${#recursive_files[@]} -eq 0 ]]; then
    error_echo "❌ 没有找到任何 .command 文件，退出。"
    exit 1
  fi

  for file in "${recursive_files[@]}"; do
    chmod +x "$file" && success_echo "授权成功：$file" || error_echo "授权失败：$file"
  done

  echo ""
  success_echo "✅ 所有子目录授权完成！"
  read "?🔚 按回车退出..."
  exit 0
}

# ✅ 拖入路径授权
authorize_dragged_paths() {
  success_echo "🔧 正在处理拖入的路径："
  for raw_path in ${(z)input_paths}; do
    local path=${raw_path:a}
    if [[ -e "$path" ]]; then
      chmod +x "$path" && success_echo "添加执行权限成功：$path" || error_echo "权限修改失败：$path"
    else
      error_echo "❌ 无效路径：$path"
    fi
  done

  echo ""
  success_echo "🎉 所有路径处理完成！可双击或终端运行这些文件。"
  read "?🔚 按回车退出..."
}

# ✅ 主函数入口
main() {
  clear
  SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
  print_intro                                              # ✅ 自述信息

  read -r "?📥 拖入路径或输入命令后回车：" input_paths

  if [[ -z "$input_paths" ]]; then
    authorize_current_dir
  elif [[ "$input_paths" == "yes" ]]; then
    authorize_recursively
  else
    authorize_dragged_paths
  fi
}

main "$@"
