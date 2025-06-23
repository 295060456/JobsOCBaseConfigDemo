#!/bin/zsh

# ✅ 打印绿色信息函数
print_green() {
  echo "\033[0;32m$1\033[0m"
}

# ✅ 显示脚本功能说明并等待用户确认
print_green "🛠️ 脚本功能："
print_green "1️⃣ 自动判断当前目录是 iOS 工程还是 Flutter 工程。"
print_green "2️⃣ 对于 Apple Silicon 架构自动使用 Rosetta 执行 pod update。"
print_green "3️⃣ 自动进入正确目录并执行 pod update。"
print_green "4️⃣ Pod 更新成功后，在桌面生成 .xcworkspace 快捷方式。"
print_green "📌 请确保已正确安装 CocoaPods。"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

# ✅ 获取脚本自身所在目录
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE_DIR" || exit 1

# ✅ 打印信息函数
print_success() { echo "✅ $1"; }
print_info()    { echo "📘 $1"; }
print_error()   { echo "❌ $1"; }

# ✅ 执行 pod update 函数
update_pod() {
  local dir="$1"
  print_info "📁 进入目录: $dir"
  cd "$dir" || {
    print_error "❌ 无法进入目录: $dir"
    exit 1
  }

  local arch="$(uname -m)"
  print_info "🧠 当前架构: $arch"

  if [[ "$arch" == "arm64" ]]; then
    print_info "🍎 使用 Rosetta 执行 pod update"
    arch -x86_64 pod update
  else
    print_info "💻 如果本地的索引（repo）是旧的，即使远程有新版本，pod update 也不知道，就更新不了。"
    print_info "💻 直接执行 pod repo update"
    pod repo update # 更新本地的 CocoaPods 索引仓库（类似于刷新源列表）。
    sleep 1  # ⏱️ 等待一下 Git repo 操作完成，增强稳定性
    print_info "💻 直接执行 pod update"
    pod update # 根据 Podfile 中的版本要求，从当前已知的 pod 索引版本中选取满足条件的最新版本。
  fi

  print_success "🎉 Pod 更新完成"

  # ✅ 查找 xcworkspace 文件并创建桌面快捷方式
  local workspace_file="$(find . -maxdepth 1 -name '*.xcworkspace' | head -n 1)"
  if [[ -n "$workspace_file" ]]; then
    local workspace_name="$(basename "$workspace_file")"
    local desktop_link="$HOME/Desktop/$workspace_name"

    print_info "🔗 检测到 workspace: $workspace_name"

    # 删除已有的同名链接或文件
    if [[ -e "$desktop_link" || -L "$desktop_link" ]]; then
      rm -f "$desktop_link"
    fi

    ln -s "$PWD/$workspace_name" "$desktop_link"
    print_success "📎 已在桌面创建快捷方式: $workspace_name"
  else
    print_error "未检测到生成的 .xcworkspace 文件"
  fi
}

# ✅ 主逻辑判断入口
print_info "📌 当前起点路径: $BASE_DIR"

if [[ -f "$BASE_DIR/Podfile" ]]; then
  print_info "📱 检测到 iOS 工程"
  update_pod "$BASE_DIR"
elif [[ -f "$BASE_DIR/pubspec.yaml" && -f "$BASE_DIR/ios/Podfile" ]]; then
  print_info "🧩 检测到 Flutter 工程，进入 ios 执行 pod update"
  update_pod "$BASE_DIR/ios"
else
  print_error "未找到 Podfile，无法继续"
  exit 1
fi
