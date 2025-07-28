#!/bin/zsh

# ✅ 临时设置 Homebrew 环境变量（仅对当前脚本有效）
if [[ -d /opt/homebrew/bin ]]; then
  export PATH="/opt/homebrew/bin:$PATH"
elif [[ -d /usr/local/bin ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

# ✅ 彩色输出封装
print_info()    { echo "\033[34m$1\033[0m"; }
print_success() { echo "\033[32m$1\033[0m"; }
print_warn()    { echo "\033[33m$1\033[0m"; }
print_error()   { echo "\033[31m$1\033[0m"; }

# ✅ 自检并安装 brew / fzf
check_and_install_tools() {
  print_info "🧪 正在检查必要工具：brew、fzf..."

  # 检查 Homebrew
  if ! command -v brew >/dev/null 2>&1; then
    print_warn "⚠️ 未检测到 Homebrew，正在下载安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # 重新添加环境变量
    if [[ -d /opt/homebrew/bin ]]; then
      export PATH="/opt/homebrew/bin:$PATH"
    elif [[ -d /usr/local/bin ]]; then
      export PATH="/usr/local/bin:$PATH"
    fi

    if ! command -v brew >/dev/null 2>&1; then
      print_error "❌ Homebrew 安装失败，请手动安装后重试"
      exit 1
    fi

    print_success "✅ Homebrew 安装成功"
  else
    print_success "✅ Homebrew 已安装"
    brew update && brew upgrade && brew cleanup
  fi

  # 检查 fzf
  if ! command -v fzf >/dev/null 2>&1 || [[ "$(command -v fzf)" == /usr/bin/* ]]; then
    print_warn "⚠️ 未检测到有效 fzf，正在通过 brew 安装..."
    brew install fzf
    print_success "✅ fzf 安装完成"
  else
    print_success "✅ fzf 已安装"
    brew upgrade fzf || true
  fi
}

# ✅ 开始主流程
echo ""
print_info "🎬 本脚本用于录制 iOS 模拟器视频"
echo "👉 流程如下："
echo "1️⃣ 选择要启动的 iOS 模拟器（fzf）"
echo "2️⃣ 自动关闭旧模拟器防止假后台"
echo "3️⃣ 自动启动模拟器并录屏"
echo "4️⃣ 再次回车停止录屏"
echo "======================================="
read "?📎 按回车继续..."

# ✅ 工具自检
check_and_install_tools

# ✅ 获取可用设备列表
print_info "🔍 正在获取可用 iOS 模拟器..."
available_devices=$(xcrun simctl list devices available | grep -E 'iPhone|iPad' | grep -v unavailable)

if [[ -z "$available_devices" ]]; then
  print_error "❌ 没有可用的 iOS 模拟器，请检查 Xcode 安装状态"
  exit 1
fi

# ✅ 使用 fzf 让用户选择设备
print_info "📱 请选择一个 iOS 模拟器（fzf）："
selected_line=$(echo "$available_devices" | fzf --height=50% --border --prompt="选择模拟器：")

if [[ -z "$selected_line" ]]; then
  print_error "❌ 未选择模拟器，已取消"
  exit 1
fi

# ✅ 提取名称与 UDID
device_udid=$(echo "$selected_line" | awk -F '[()]' '{print $2}')
device_name=$(echo "$selected_line" | awk -F '[()]' '{print $1}' | sed 's/ *$//')

print_success "✅ 你选择的设备是：$device_name [$device_udid]"

# ✅ 关闭所有模拟器（防止假后台）
print_info "🧹 正在关闭所有正在运行的模拟器..."
osascript -e 'quit app "Simulator"' >/dev/null 2>&1 || true
xcrun simctl shutdown all >/dev/null 2>&1 || true
sleep 1

# ✅ 启动模拟器
print_info "🚀 启动模拟器中..."
open -a Simulator --args -CurrentDeviceUDID "$device_udid"

# ✅ 等待模拟器启动成功
print_info "⏳ 等待模拟器完全启动..."
while true; do
  booted=$(xcrun simctl list devices booted | grep "$device_udid")
  if [[ -n "$booted" ]]; then
    break
  fi
  sleep 1
done

print_success "✅ 模拟器已启动：$device_name"

# ✅ 输入视频文件名
read "?📝 请输入视频文件名（无需加 .mp4，默认 output）： " filename
filename=${filename:-output}
output_file="${filename}.mp4"
print_info "🎯 视频文件名：$output_file"

# ✅ 开始录制
print_info "🎥 正在录制中...（再次按回车停止）"
xcrun simctl io "$device_udid" recordVideo "$output_file" &

record_pid=$!
read "?⏹ 录制中，按回车停止..."

# ✅ 停止录制
kill -INT $record_pid
wait $record_pid

print_success "🎉 录制完成：$output_file"

# ✅ 打开 Finder 定位生成文件
open "$(dirname "$output_file")"
