#!/bin/zsh

# ✅ 日志与彩色输出
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

# ✅ 全局初始化配置
init_env() {
  export CURL_HTTP_VERSION=1.1
  info_echo "📡 强制设置 CURL_HTTP_VERSION=1.1，避免 HTTP2 CDN 拉取错误"

  BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
  cd "$BASE_DIR"
  info_echo "📌 当前起点路径: $BASE_DIR"

  CONFIG_FILE="$HOME/.cocoapods_mirror_config"
}

# ✅ CocoaPods CDN 可用性检查
check_cdn_available() {
  info_echo "🌐 检查 cdn.cocoapods.org 是否可访问..."
  if curl -I --max-time 3 https://cdn.cocoapods.org/all_pods_versions_c_0_4.txt 2>/dev/null | grep -q "200 OK"; then
    success_echo "CDN 可用"
    return 0
  else
    error_echo "🚫 CDN 不可用"
    return 1
  fi
}

# ✅ 切换镜像源并保存
switch_cocoapods_source() {
  local sources=(
    "清华源|https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git"
    "华为源|https://repo.huaweicloud.com/repository/CocoaPods/"
  )
  local selected_source url

  selected_source=$(printf "%s\n" "${sources[@]}" | fzf --prompt="🎯 选择 CocoaPods 镜像源：") || return 1
  url="${${selected_source}#*|}"

  info_echo "🧩 正在切换镜像源为: $url"
  pod repo remove trunk >/dev/null 2>&1 || true
  pod repo add trunk "$url"
  echo "$url" > "$CONFIG_FILE"
  success_echo "📦 已记住镜像源: $url"
}

# ✅ 应用缓存或选择镜像源
auto_apply_cached_source() {
  if [[ -f "$CONFIG_FILE" ]]; then
    local url
    url=$(cat "$CONFIG_FILE")
    info_echo "📄 检测到已缓存镜像源: $url"

    if ! pod repo list | grep -q "$url"; then
      info_echo "🔁 当前未配置该源，自动切换中..."
      pod repo remove trunk >/dev/null 2>&1 || true
      pod repo add trunk "$url"
      success_echo "📦 镜像源已应用: $url"
    else
      success_echo "🧠 镜像源已是缓存设置，无需变更"
    fi
  else
    check_cdn_available || switch_cocoapods_source
  fi
}

# ✅ 执行 pod install 操作
install_pod() {
  local dir="$1"
  info_echo "📁 进入目录: $dir"
  cd "$dir" || { error_echo "❌ 无法进入目录: $dir"; exit 1; }

  local arch="$(uname -m)"
  local POD_CMD="pod install --repo-update --verbose"
  info_echo "🧠 当前架构: $arch"

  if [[ "$arch" == "arm64" ]]; then
    local pod_binary="$(which pod)"
    [[ -z "$pod_binary" ]] && error_echo "❌ 未找到 pod 命令" && exit 1

    local arch_info="$(lipo -info "$pod_binary")"
    info_echo "🧩 pod 架构信息: $arch_info"

    if echo "$arch_info" | grep -q "x86_64"; then
      info_echo "🍎 使用 Rosetta 模式执行"
      POD_CMD="arch -x86_64 $POD_CMD"
    else
      info_echo "💻 直接执行 pod install"
    fi
  fi

  info_echo "⚙️ 执行命令: $POD_CMD"
  eval "$POD_CMD"
  success_echo "🎉 Pod 安装完成"

  create_desktop_shortcut_if_needed
}

# ✅ 创建桌面快捷方式（如有 .xcworkspace）
create_desktop_shortcut_if_needed() {
  local workspace_file
  workspace_file="$(find . -maxdepth 1 -name '*.xcworkspace' | head -n 1)"

  if [[ -n "$workspace_file" ]]; then
    local name="$(basename "$workspace_file")"
    local link="$HOME/Desktop/$name"

    if [[ -e "$link" || -L "$link" ]]; then
      info_echo "🔗 桌面已存在快捷方式，跳过创建"
    else
      ln -s "$PWD/$name" "$link"
      success_echo "📎 已在桌面创建快捷方式: $name"
    fi
  else
    error_echo "❌ 未检测到生成的 .xcworkspace 文件"
  fi
}

# ✅ 检测项目类型并执行 pod 安装
detect_project_type_and_install() {
  if [[ -f "$BASE_DIR/Podfile" ]]; then
    info_echo "📱 检测到 iOS 工程"
    auto_apply_cached_source
    install_pod "$BASE_DIR"

  elif [[ -f "$BASE_DIR/pubspec.yaml" && -f "$BASE_DIR/ios/Podfile" ]]; then
    info_echo "🧩 检测到 Flutter 工程，进入 ios 目录执行 pod install"
    auto_apply_cached_source
    install_pod "$BASE_DIR/ios"

  else
    error_echo "❌ 未找到 Podfile，无法继续"
    exit 1
  fi
}

# ✅ 主函数入口
main() {
  init_env                            # 🌐 初始化环境变量和目录路径
  detect_project_type_and_install     # 检测项目类型并执行 pod 安装
}

main "$@"
