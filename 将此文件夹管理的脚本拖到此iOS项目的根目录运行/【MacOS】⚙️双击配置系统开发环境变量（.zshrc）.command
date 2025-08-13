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

# ✅ 初始化变量
init_vars() {
  TARGET_FILE="$HOME/.zshrc"  # 🎯 可替换为 .bash_profile、.bashrc 等
  BLOCK_TAG='flutter() { fvm flutter'
}

# ✅ 构建追加内容
build_append_block() {
  APPEND_BLOCK=$(cat <<EOF
flutter() { fvm flutter "\$@"; }

# 一键重新加载常见配置文件：jobs
jobs() {
  local files=(
    "\$HOME/.bash_profile"
    "\$HOME/.bashrc"
    "\$HOME/.oh-my-zsh/oh-my-zsh.sh"  # 去掉 \$HOME/.zshrc
  )
  for file in "\${files[@]}"; do
    if [[ -f "\$file" ]]; then
      source "\$file"
      echo "\\033[1;32m✅ 已加载配置文件：file://\$file\\033[0m"
    else
      echo "\\033[1;33m⚠️ 未找到配置文件：file://\$file\\033[0m"
    fi
  done
  echo "\\n📎 ⌘Command + 点击路径可打开对应文件（macOS Terminal 支持）"
}

# 仅首次执行 jobs 函数，防止递归
if [[ -z "\$JOBS_ALREADY_RUN" ]]; then
  export JOBS_ALREADY_RUN=1
  command -v jobs &>/dev/null && jobs
fi

clear
EOF
)
}

# ✅ 检查并追加内容
append_if_needed() {
  if grep -q "$BLOCK_TAG" "$TARGET_FILE"; then
    info_echo "内容已存在于 $TARGET_FILE，跳过追加"
  else
    info_echo "📝 正在追加内容到 $TARGET_FILE ..."
    echo "\n$APPEND_BLOCK" >> "$TARGET_FILE"
    success_echo "已追加并更新：$TARGET_FILE"
  fi
}

# ✅ 主函数入口
main() {
  clear
  init_vars              # 初始化变量
  build_append_block     # 构建追加内容
  append_if_needed       # 检查并追加内容
}

main "$@"
