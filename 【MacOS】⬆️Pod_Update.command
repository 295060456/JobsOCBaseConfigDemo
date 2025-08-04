#!/bin/zsh

# ✅ 日志与语义输出
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

# ✅ 基础路径配置
BASE_DIR="$(cd "$(dirname "$0")" && pwd -P)"
readonly BASE_DIR
CONFIG_FILE="$HOME/.cocoapods_mirror_config"

# ✅ 自述信息
print_intro() {
  clear
  note_echo "🛠️ 脚本功能简介："
  note_echo "➤ 自动判断当前目录是 iOS 工程还是 Flutter 工程"
  note_echo "➤ 检测 CDN 可用性，缓存并自动切换 CocoaPods 镜像"
  note_echo "➤ 支持 Apple Silicon 使用 Rosetta 执行 pod update"
  note_echo "➤ 更新成功后自动创建桌面 .xcworkspace 快捷方式"
  warn_echo "📌 请确保已安装 CocoaPods 和 fzf"
  echo ""
  read "?👉 按下回车键继续执行，或 Ctrl+C 取消..."
}

# ✅ CDN 检测与镜像配置
check_cdn_available() {
  info_echo "🌐 正在检测 cdn.cocoapods.org 可用性..."
  if curl -I --max-time 3 https://cdn.cocoapods.org/all_pods_versions_c_0_4.txt 2>/dev/null | grep -q "200 OK"; then
    success_echo "CDN 可用"
    return 0
  else
    error_echo "CDN 不可访问，将提示你手动切换镜像"
    return 1
  fi
}

switch_cocoapods_source() {
  local sources=("清华源|https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git" "华为源|https://repo.huaweicloud.com/repository/CocoaPods/")
  local selected=$(printf "%s\n" "${sources[@]}" | fzf --prompt="🎯 选择 CocoaPods 镜像源：") || return 1
  local url="${${selected}#*|}"

  info_echo "🧩 正在切换镜像源为：$url"
  pod repo remove trunk >/dev/null 2>&1
  pod repo add trunk "$url"
  echo "$url" > "$CONFIG_FILE"
  success_echo "镜像源设置并缓存成功：$url"
}

auto_apply_cached_source() {
  if [[ -f "$CONFIG_FILE" ]]; then
    local url=$(cat "$CONFIG_FILE")
    info_echo "📄 读取镜像缓存：$url"
    if ! pod repo list | grep -q "$url"; then
      info_echo "🔁 当前未配置该镜像，正在切换..."
      pod repo remove trunk >/dev/null 2>&1
      pod repo add trunk "$url"
      success_echo "✅ 镜像源应用成功"
    else
      success_echo "✅ 镜像源已配置，无需切换"
    fi
  else
    check_cdn_available || switch_cocoapods_source
  fi
}

# ✅ Pod 更新流程
update_pod_in_dir() {
  local dir="$1"
  info_echo "📁 正在进入目录：$dir"
  cd "$dir" || {
    error_echo "无法进入目录：$dir"
    exit 1
  }

  auto_apply_cached_source

  local arch="$(uname -m)"
  info_echo "🧠 当前芯片架构：$arch"

  if [[ "$arch" == "arm64" ]]; then
    info_echo "🍎 使用 Rosetta 执行 pod update"
    arch -x86_64 pod update
  else
    info_echo "💻 执行 pod repo update..."
    pod repo update
    sleep 1
    pod update
  fi

  success_echo "🎉 Pod 更新完成"

  # 创建桌面快捷方式（.xcworkspace）
  local workspace_file
  workspace_file="$(find . -maxdepth 1 -name '*.xcworkspace' | head -n 1)"
  if [[ -n "$workspace_file" ]]; then
    local link="$HOME/Desktop/$(basename "$workspace_file")"
    if [[ -e "$link" || -L "$link" ]]; then
      info_echo "📎 桌面已存在同名链接，跳过创建"
    else
      ln -s "$PWD/$workspace_file" "$link"
      success_echo "📎 已创建桌面快捷方式：$link"
    fi
  else
    warn_echo "⚠️ 未检测到 .xcworkspace 文件"
  fi
}

# ✅ 项目类型判断与 Pod 更新
detect_and_update_project_type() {
  # 判断当前工程类型并执行更新
  if [[ -f "$BASE_DIR/Podfile" ]]; then
    info_echo "📱 检测到 iOS 工程，执行更新..."
    update_pod_in_dir "$BASE_DIR"
  elif [[ -f "$BASE_DIR/pubspec.yaml" && -f "$BASE_DIR/ios/Podfile" ]]; then
    info_echo "🧩 检测到 Flutter 工程，进入 ios 执行 pod update..."
    update_pod_in_dir "$BASE_DIR/ios"
  else
    error_echo "✖ 未找到 Podfile，无法继续执行"
    exit 1
  fi
}

# ✅ 主函数入口
main() {
    print_intro                         # ✅ 自述信息
    detect_and_update_project_type      # ✅ 判断当前工程类型并执行更新
}

main "$@"
