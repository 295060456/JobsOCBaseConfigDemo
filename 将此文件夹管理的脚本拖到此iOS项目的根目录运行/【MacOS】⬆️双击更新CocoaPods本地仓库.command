#!/bin/zsh

# ✅ 日志与彩色输出
SCRIPT_BASENAME=$(basename "$0" | sed 's/\.[^.]*$//')
LOG_FILE="/tmp/${SCRIPT_BASENAME}.log"

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

# ✅ 初始化项目根路径
init_basedir() {
  basedir=$(cd "$(dirname "$0")"; pwd -P)
  gray_echo "📂 当前项目的绝对路径: $basedir"
}

# ✅ 自述信息
print_intro() {
  clear
  success_echo "🛠️ 脚本功能："
  success_echo "1️⃣ 给当前目录所有文件添加可执行权限"
  success_echo "2️⃣ 自动删除 .xcworkspace、Pods、Podfile.lock"
  success_echo "3️⃣ 自动执行 pod install / pod repo update"
  success_echo "🧩 同时兼容 Flutter 与原生 iOS 项目"
  echo ""
  read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."
}

# ✅ 添加执行权限
make_files_executable() {
  for file in "$basedir"/*; do
    if [[ -f "$file" ]]; then
      chmod +x "$file"
      success_echo "已添加执行权限：$(basename "$file")"
    fi
  done
}

# ✅ 清理 CocoaPods 缓存
clean_pod_cache() {
  project_file=$(find "$basedir" -maxdepth 1 -name "*.xcodeproj" | head -n 1)
  if [[ -z "$project_file" ]]; then
    error_echo "❌ 未找到 .xcodeproj 文件，请确认项目路径正确"
    exit 1
  fi

  ProjName=$(basename "$project_file" .xcodeproj)
  success_echo "✅ 当前工程名称为：$ProjName"

  local xcworkspace="$basedir/${ProjName}.xcworkspace"
  local pods_dir="$basedir/Pods"
  local podfile_lock="$basedir/Podfile.lock"

  [[ -d "$xcworkspace" ]] && warn_echo "🗑️ 删除：$xcworkspace" && rm -rf "$xcworkspace"
  [[ -d "$pods_dir" ]] && warn_echo "🗑️ 删除：$pods_dir" && rm -rf "$pods_dir"
  [[ -f "$podfile_lock" ]] && warn_echo "🗑️ 删除：$podfile_lock" && rm -f "$podfile_lock"

  success_echo "✅ 工程 $ProjName 的旧缓存清理完毕"
}

# ✅ 执行 CocoaPods 安装
run_pod_install() {
  cd "$basedir" || exit 1

  if [[ -f "$basedir/pubspec.yaml" && -d "$basedir/ios" ]]; then
    warn_echo "🧩 检测到 Flutter 工程，进入 ios 执行 pod install"
    cd ios || exit 1
  fi

  info_echo "🚀 正在执行 pod install..."
  pod install
  pod setup
  pod repo update --verbose
  success_echo "🎉 CocoaPods 安装与更新完成"
}

# ✅ 主函数入口
main() {
    init_basedir                           # 初始化项目根路径
    print_intro                            # 自述信息
    make_files_executable                  # 🔐 添加当前目录所有文件的执行权限
    clean_pod_cache                        # 🧹 清除 Pods 缓存、workspace 和 lock
    run_pod_install                        # ⚙️ 执行 pod install 相关流程
}

main "$@"
