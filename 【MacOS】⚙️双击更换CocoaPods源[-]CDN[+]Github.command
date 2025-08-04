#!/bin/zsh

# ✅ 全局配置
LOG_FILE="/tmp/fix_cocoapods_git_repo.log"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

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

# ✅ 自述信息
print_description() {
  echo ""
  color_echo "||=================================================||"
  color_echo "||  JJJJJJJJ     oooooo    bb          SSSSSSSSSS  ||"
  color_echo "||        JJ    oo    oo   bb          SS      SS  ||"
  color_echo "||        JJ    oo    oo   bb          SS          ||"
  color_echo "||        JJ    oo    oo   bbbbbbbbb   SSSSSSSSSS  ||"
  color_echo "||  J     JJ    oo    oo   bb      bb          SS  ||"
  color_echo "||  JJ    JJ    oo    oo   bb      bb  SS      SS  ||"
  color_echo "||   JJJJJJ      oooooo     bbbbbbbb   SSSSSSSSSS  ||"
  color_echo "||=================================================||"
  echo ""
  note_echo "🛠 CocoaPods Git 源修复工具"
  note_echo "➤ 删除 trunk（默认 CDN 源）"
  note_echo "➤ 删除本地 Git 缓存目录 ~/.cocoapods/repos/cocoapods"
  note_echo "➤ 添加 Git 源：https://github.com/CocoaPods/Specs.git"
  echo ""
  read "?👉 按下回车键继续，或 Ctrl+C 退出："
  echo ""
}

# ✅ 删除 trunk CDN 源
remove_cdn_trunk_repo() {
  if pod repo list | grep -q "^trunk"; then
    warn_echo "🔍 检测到 trunk（CDN 源），正在删除..."
    pod repo remove trunk
  else
    success_echo "✅ 未检测到 trunk，无需处理"
  fi
}

# ✅ 删除本地 Git 缓存
remove_local_git_cache() {
  local path="$HOME/.cocoapods/repos/cocoapods"
  if [[ -d "$path" ]]; then
    warn_echo "🗑️ 正在删除本地缓存：$path"
    rm -rf "$path"
  else
    success_echo "✅ 本地 Git 缓存不存在"
  fi
}

# ✅ 添加 Git 源
add_git_repo() {
  highlight_echo "🔗 正在添加 Git 源：https://github.com/CocoaPods/Specs.git"
  pod repo add cocoapods https://github.com/CocoaPods/Specs.git
}

# ✅ 显示最终结果
show_result() {
  if [[ $? -eq 0 ]]; then
    success_echo "🎉 CocoaPods Git 源添加成功！"
  else
    error_echo "❌ 添加失败，请检查网络或手动处理"
  fi
}

# ✅ 主函数入口
main() {
  clear
  print_description           # 🖨️ 自述信息
  remove_cdn_trunk_repo       # 🧹 删除 CDN 源 trunk
  remove_local_git_cache      # 🧹 删除本地缓存目录
  add_git_repo                # ➕ 添加 Git 源
  show_result                 # 📢 显示成功与否
}

main "$@"
