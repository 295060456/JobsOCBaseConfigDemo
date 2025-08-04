#!/bin/zsh

# ✅ 全局配置
FUNC_NAME="jobs"
CONFIG_FILES=(
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.zshrc"
  "$HOME/.oh-my-zsh/oh-my-zsh.sh"
)

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

# ✅ 写入 jobs 函数到 ~/.zshrc
write_jobs_function() {
  if grep -q "^[[:space:]]*${FUNC_NAME}()" "$HOME/.zshrc"; then
    info_echo "函数 '${FUNC_NAME}' 已存在于 ~/.zshrc，跳过写入"
    return
  fi

  note_echo "📝 正在将 '${FUNC_NAME}' 函数写入 ~/.zshrc ..."
  cat >> ~/.zshrc <<'EOF'

# ✅ 一键重新加载常见配置文件：jobs
jobs() {
  local files=(
    "$HOME/.bash_profile"
    "$HOME/.bashrc"
    "$HOME/.zshrc"
    "$HOME/.oh-my-zsh/oh-my-zsh.sh"
  )
  for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
      source "$file"
      echo "\033[1;32m✅ 已加载配置文件：file://$file\033[0m"
    else
      echo "\033[1;33m⚠️ 未找到配置文件：file://$file\033[0m"
    fi
  done
  echo "\n📎 ⌘Command + 点击路径可打开对应文件（macOS Terminal 支持）"
}
EOF

  success_echo "函数 '${FUNC_NAME}' 已成功添加到 ~/.zshrc"
}

# ✅ 立即加载并打印 file:// 路径
load_and_print_config_files() {
  for file in "${CONFIG_FILES[@]}"; do
    if [[ -f "$file" ]]; then
      source "$file"
      success_echo "✅ 已加载配置文件：file://$file"
    else
      warn_echo "⚠️ 未找到配置文件：file://$file"
    fi
  done
}

# ✅ 脚本入口主函数
main() {
  write_jobs_function          # 🛠️ 写入 jobs 函数到 ~/.zshrc（如不存在）
  load_and_print_config_files  # ✅ 遍历并加载配置文件，输出路径链接提示
  echo ""
  note_echo "📎 ⌘Command + 点击以上 file:// 路径可直接打开对应文件（macOS Terminal 支持）"
  highlight_echo "📦 请执行 $(underline_echo "source ~/.zshrc") 以使 '${FUNC_NAME}' 函数立即生效"
}

main "$@"
