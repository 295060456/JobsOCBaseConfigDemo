#!/bin/zsh

if [[ "$CURL_HTTP_VERSION" != "1.1" ]]; then
  export CURL_HTTP_VERSION=1.1
  echo "📡 强制设置 CURL_HTTP_VERSION=1.1，避免 HTTP2 CDN 拉取错误"
fi

# ✅ 打印函数
print_green()   { echo "\033[0;32m$1\033[0m"; }
print_success() { echo "✅ $1"; }
print_info()    { echo "📘 $1"; }
print_error()   { echo "❌ $1"; }

# ✅ 脚本说明
print_green "🛠️ 脚本功能："
print_green "1️⃣ 自动判断是 iOS 或 Flutter 工程，并进入正确目录"
print_green "2️⃣ 自动检测 CDN 可用性，首次失败可 fzf 切换镜像并记忆配置"
print_green "3️⃣ 自动判断是否已有 .xcworkspace，避免重复生成"
print_green "4️⃣ Apple Silicon 架构自动适配 Rosetta"
print_green "5️⃣ CocoaPods 安装完成后自动创建桌面快捷方式"
print_green "📌 请确保已安装 CocoaPods 和 fzf"
echo ""
read "?👉 按下回车键继续执行，或 Ctrl+C 取消..."

# ✅ 获取脚本当前路径
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR" || exit 1
print_info "📌 当前起点路径: $BASE_DIR"

# ✅ 镜像源配置文件
CONFIG_FILE="$HOME/.cocoapods_mirror_config"

# ✅ 检查 CDN 可用性
check_cdn_available() {
  print_info "🌐 检查 cdn.cocoapods.org 是否可访问..."
  if curl -I --max-time 3 https://cdn.cocoapods.org/all_pods_versions_c_0_4.txt 2>/dev/null | grep -q "200 OK"; then
    print_success "✅ CDN 可用"
    return 0
  else
    print_error "🚫 CDN 不可用"
    return 1
  fi
}

# ✅ 切换镜像源并缓存
switch_cocoapods_source() {
  local selected_source
  local sources=("清华源|https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git" "华为源|https://repo.huaweicloud.com/repository/CocoaPods/")
  
  selected_source=$(printf "%s\n" "${sources[@]}" | fzf --prompt="🎯 选择 CocoaPods 镜像源：") || return 1
  local url="${${selected_source}#*|}"

  print_info "🧩 正在切换镜像源为: $url"
  pod repo remove trunk >/dev/null 2>&1
  pod repo add trunk "$url"
  echo "$url" > "$CONFIG_FILE"
  print_success "📦 已记住镜像源: $url"
}

# ✅ 自动应用缓存镜像
auto_apply_cached_source() {
  if [[ -f "$CONFIG_FILE" ]]; then
    local url
    url=$(cat "$CONFIG_FILE")
    print_info "📄 检测到已缓存的镜像源: $url"

    # 判断当前是否已设置此源
    if ! pod repo list | grep -q "$url"; then
      print_info "🔁 当前未配置该源，自动切换中..."
      pod repo remove trunk >/dev/null 2>&1
      pod repo add trunk "$url"
      print_success "📦 镜像源已应用: $url"
    else
      print_success "🧠 镜像源已是缓存设置，无需变更"
    fi
  else
    check_cdn_available || switch_cocoapods_source
  fi
}

# ✅ pod install 操作
install_pod() {
  local dir="$1"
  print_info "📁 进入目录: $dir"
  cd "$dir" || {
    print_error "❌ 无法进入目录: $dir"
    exit 1
  }

  local arch="$(uname -m)"
  print_info "🧠 当前架构: $arch"
  local POD_CMD="pod install --repo-update --verbose"

  if [[ "$arch" == "arm64" ]]; then
    local pod_binary
    pod_binary="$(which pod)"
    [[ -z "$pod_binary" ]] && print_error "❌ 未找到 pod 命令" && exit 1

    local arch_info
    arch_info=$(lipo -info "$pod_binary")
    print_info "🧩 pod 架构信息: $arch_info"

    if echo "$arch_info" | grep -q "x86_64"; then
      print_info "🍎 使用 Rosetta 模式执行"
      POD_CMD="arch -x86_64 pod install --repo-update --verbose"
    else
      print_info "💻 直接执行 pod install"
    fi
  fi

  print_info "⚙️ 执行命令: $POD_CMD"
  eval "$POD_CMD"
  print_success "🎉 Pod 安装完成"

  # ✅ 检查 .xcworkspace 是否存在
  local workspace_file
  workspace_file="$(find . -maxdepth 1 -name '*.xcworkspace' | head -n 1)"
  if [[ -n "$workspace_file" ]]; then
    local workspace_name
    workspace_name="$(basename "$workspace_file")"
    local desktop_link="$HOME/Desktop/$workspace_name"

    if [[ -L "$desktop_link" || -e "$desktop_link" ]]; then
      print_info "🔗 桌面已存在同名快捷方式，跳过创建"
    else
      ln -s "$PWD/$workspace_name" "$desktop_link"
      print_success "📎 已在桌面创建快捷方式: $workspace_name"
    fi
  else
    print_error "❌ 未检测到生成的 .xcworkspace 文件"
  fi
}

# ✅ 主逻辑
if [[ -f "$BASE_DIR/Podfile" ]]; then
  print_info "📱 检测到 iOS 工程"
  auto_apply_cached_source
  install_pod "$BASE_DIR"
elif [[ -f "$BASE_DIR/pubspec.yaml" && -f "$BASE_DIR/ios/Podfile" ]]; then
  print_info "🧩 检测到 Flutter 工程，进入 ios 目录执行 pod install"
  auto_apply_cached_source
  install_pod "$BASE_DIR/ios"
else
  print_error "❌ 未找到 Podfile，无法继续"
  exit 1
fi
