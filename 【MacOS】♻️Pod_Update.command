#!/bin/zsh

# ✅ 设置 HTTP/1.1 避免 CDN HTTP2 错误
if [[ "$CURL_HTTP_VERSION" != "1.1" ]]; then
  export CURL_HTTP_VERSION=1.1
  echo "📡 强制设置 CURL_HTTP_VERSION=1.1，避免 HTTP2 CDN 拉取错误"
fi

# ✅ 打印函数
print_green()   { echo "\033[0;32m$1\033[0m"; }
print_success() { echo "✅ $1"; }
print_info()    { echo "📘 $1"; }
print_error()   { echo "❌ $1"; }

# ✅ 自述说明
print_green "🛠️ 脚本功能："
print_green "1️⃣ 自动判断当前目录是 iOS 工程还是 Flutter 工程。"
print_green "2️⃣ 检测 CDN 可用性，自动缓存并切换 CocoaPods 镜像。"
print_green "3️⃣ Apple Silicon 自动使用 Rosetta 执行 pod update。"
print_green "4️⃣ 更新成功后自动创建桌面 .xcworkspace 快捷方式（避免重复）。"
print_green "📌 请确保已安装 CocoaPods 和 fzf。"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

# ✅ 当前目录路径
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR" || exit 1
print_info "📌 当前起点路径: $BASE_DIR"

# ✅ 镜像缓存路径
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

# ✅ 让用户用 fzf 切换镜像源
switch_cocoapods_source() {
  local selected_source
  local sources=("清华源|https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git" "华为源|https://repo.huaweicloud.com/repository/CocoaPods/")

  selected_source=$(printf "%s\n" "${sources[@]}" | fzf --prompt="🎯 选择 CocoaPods 镜像源：") || return 1
  local url="${${selected_source}#*|}"

  print_info "🧩 正在切换镜像源为: $url"
  pod repo remove trunk >/dev/null 2>&1
  pod repo add trunk "$url"
  echo "$url" > "$CONFIG_FILE"
  print_success "📦 镜像源已设置并缓存: $url"
}

# ✅ 自动读取并应用镜像缓存
auto_apply_cached_source() {
  if [[ -f "$CONFIG_FILE" ]]; then
    local url
    url=$(cat "$CONFIG_FILE")
    print_info "📄 读取缓存镜像源: $url"

    if ! pod repo list | grep -q "$url"; then
      print_info "🔁 当前未配置该源，正在应用缓存..."
      pod repo remove trunk >/dev/null 2>&1
      pod repo add trunk "$url"
      print_success "✅ 镜像源已应用"
    else
      print_success "🧠 镜像源已配置，无需切换"
    fi
  else
    check_cdn_available || switch_cocoapods_source
  fi
}

# ✅ 执行 pod update
update_pod() {
  local dir="$1"
  print_info "📁 进入目录: $dir"
  cd "$dir" || {
    print_error "❌ 无法进入目录: $dir"
    exit 1
  }

  auto_apply_cached_source

  local arch="$(uname -m)"
  print_info "🧠 当前架构: $arch"

  if [[ "$arch" == "arm64" ]]; then
    print_info "🍎 使用 Rosetta 执行 pod update"
    arch -x86_64 pod update
  else
    print_info "💻 更新本地索引 repo..."
    pod repo update
    sleep 1
    print_info "💻 执行 pod update"
    pod update
  fi

  print_success "🎉 Pod 更新完成"

  # ✅ 创建桌面快捷方式（如果未存在）
  local workspace_file
  workspace_file="$(find . -maxdepth 1 -name '*.xcworkspace' | head -n 1)"
  if [[ -n "$workspace_file" ]]; then
    local workspace_name="$(basename "$workspace_file")"
    local desktop_link="$HOME/Desktop/$workspace_name"

    print_info "🔗 检测到 workspace: $workspace_name"
    if [[ -e "$desktop_link" || -L "$desktop_link" ]]; then
      print_info "📎 桌面已存在同名链接，跳过创建"
    else
      ln -s "$PWD/$workspace_name" "$desktop_link"
      print_success "📎 已在桌面创建快捷方式: $workspace_name"
    fi
  else
    print_error "❌ 未检测到 .xcworkspace 文件"
  fi
}

# ✅ 主逻辑判断入口
if [[ -f "$BASE_DIR/Podfile" ]]; then
  print_info "📱 检测到 iOS 工程"
  update_pod "$BASE_DIR"
elif [[ -f "$BASE_DIR/pubspec.yaml" && -f "$BASE_DIR/ios/Podfile" ]]; then
  print_info "🧩 检测到 Flutter 工程，进入 ios 执行 pod update"
  update_pod "$BASE_DIR/ios"
else
  print_error "❌ 未找到 Podfile，无法继续"
  exit 1
fi
