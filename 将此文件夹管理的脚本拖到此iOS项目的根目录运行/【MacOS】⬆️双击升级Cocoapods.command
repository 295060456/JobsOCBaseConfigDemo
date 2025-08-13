#!/bin/zsh

# ✅ 彩色输出函数 🌈
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')   # 当前脚本名（去掉扩展名）
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"                  # 设置对应的日志文件路径

log()            { echo -e "$1" | tee -a "$LOG_FILE"; }
color_echo()     { log "\033[1;32m$1\033[0m"; }         # ✅ 正常绿色输出
info_echo()      { log "\033[1;34mℹ $1\033[0m"; }       # ℹ 信息
success_echo()   { log "\033[1;32m✔ $1\033[0m"; }       # ✔ 成功
warn_echo()      { log "\033[1;33m⚠ $1\033[0m"; }       # ⚠ 警告
warm_echo()      { log "\033[1;33m$1\033[0m"; }         # 🟡 温馨提示（无图标）
note_echo()      { log "\033[1;35m➤ $1\033[0m"; }       # ➤ 说明
error_echo()     { log "\033[1;31m✖ $1\033[0m"; }       # ✖ 错误
err_echo()       { log "\033[1;31m$1\033[0m"; }         # 🔴 错误纯文本
debug_echo()     { log "\033[1;35m🐞 $1\033[0m"; }      # 🐞 调试
highlight_echo() { log "\033[1;36m🔹 $1\033[0m"; }      # 🔹 高亮
gray_echo()      { log "\033[0;90m$1\033[0m"; }         # ⚫ 次要信息
bold_echo()      { log "\033[1m$1\033[0m"; }            # 📝 加粗
underline_echo() { log "\033[4m$1\033[0m"; }            # 🔗 下划线

# ✅ 自述信息
print_usage() {
  success_echo "🛠️ CocoaPods 环境升级助手"
  echo "===================================================================="
  note_echo "1️⃣ 检查当前 Ruby 与 gem 环境"
  note_echo "2️⃣ 检查已安装的 CocoaPods 版本"
  note_echo "3️⃣ 如果非最新，则卸载所有旧版本并安装最新版本"
  note_echo "4️⃣ 验证 pod 命令路径，确保配置生效"
  echo "===================================================================="
  echo ""
  read "?👉 按下回车继续执行，或 Ctrl+C 取消..."
}

# ✅ 检查当前 CocoaPods 版本
check_current_pod_version() {
  if command -v pod &>/dev/null; then
    CURRENT_VERSION=$(pod --version)
    success_echo "当前 pod 版本：$CURRENT_VERSION"
  else
    error_echo "未检测到 pod 命令，可能未安装或环境异常"
    CURRENT_VERSION="none"
  fi
}

# ✅ 获取最新版本 🔍
get_latest_version() {
  LATEST_VERSION=$(gem list -r ^cocoapods$ | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | sort -V | tail -n 1)
  info_echo "远程可用最新版：$LATEST_VERSION"
}

# ✅ 检查 Ruby 与 gem 环境 🔧
check_ruby_env() {
  RUBY_PATH=$(rbenv which ruby 2>/dev/null)
  GEM_HOME=$(gem env home)
  gray_echo "当前 Ruby 路径：$RUBY_PATH"
  gray_echo "当前 gem 安装路径：$GEM_HOME"
}

# ✅ 卸载全部 CocoaPods 🧹
remove_all_cocoapods() {
  warn_echo "卸载所有已安装的 CocoaPods..."
  gem list --local cocoapods | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | while read -r ver; do
    warn_echo "正在卸载版本 $ver ..."
    sudo gem uninstall cocoapods -v "$ver" -aIx
  done
}

# ✅ 安装最新 CocoaPods 📦
install_latest_cocoapods() {
  info_echo "正在安装 CocoaPods $LATEST_VERSION..."
  sudo gem install cocoapods -v "$LATEST_VERSION"
}

# ✅ 刷新环境缓存 🔁
refresh_env() {
  gray_echo "刷新环境缓存中..."
  hash -r
  if command -v rbenv &>/dev/null; then
    gray_echo "rbenv 环境下，执行 rehash ..."
    rbenv rehash
  fi
}

# ✅ 查看 pod 路径 🔍
check_pod_location() {
  POD_PATH=$(which pod)
  success_echo "当前 pod 命令路径：$POD_PATH"
}

# ✅ 升级判断与处理 ♻️
upgrade_if_needed() {
  # ✅ 判断是否为最新版
  if [[ "$CURRENT_VERSION" == "$LATEST_VERSION" ]]; then
    success_echo "✔ 当前已是最新版本，无需升级"
  else
    remove_all_cocoapods                      # ✅ 清空旧版本 🧹 
    install_latest_cocoapods                  # ✅ 安装新版本 📦
    refresh_env                               # ✅ 刷新环境 🔁
    check_current_pod_version                 # ✅ 再次确认：检查当前 CocoaPods 版本
    success_echo "🎉 升级完成，当前版本为：$(pod --version)"
  fi
}

# ✅ 主函数入口 🚀
main() {
  print_usage                                 # ✅ 自述信息 🖨️
  info_echo "🚀 CocoaPods 升级脚本开始执行..."
  check_ruby_env                              # ✅ 检查 Ruby 与 gem 环境 🔧
  check_current_pod_version                   # ✅ 获取当前版本：检查当前 CocoaPods 版本 🧪
  get_latest_version                          # ✅ 获取远程版本 🔍
  upgrade_if_needed                           # ✅ 判断是否为最新版 ♻️
  check_pod_location                          # ✅ 打印 pod 命令路径 🔍
}

main "$@"
