#!/bin/zsh

# ✅ 彩色输出函数
_color_echo() {
  local color="$1"
  local text="$2"
  case "$color" in
    green) echo "\033[32m$text\033[0m" ;;
    red) echo "\033[31m$text\033[0m" ;;
    yellow) echo "\033[33m$text\033[0m" ;;
    blue) echo "\033[34m$text\033[0m" ;;
    cyan) echo "\033[36m$text\033[0m" ;;
    *) echo "$text" ;;
  esac
}

# ✅ Logo
_color_echo cyan "═════════════════════════════════════════════════════════════════════"
_color_echo cyan "📱 iOS 模拟器创建器 - 使用 fzf 选择设备与系统版本"
_color_echo cyan "═════════════════════════════════════════════════════════════════════"

# ✅ 彻底关闭模拟器
_color_echo yellow "🛑 正在彻底关闭所有 iOS 模拟器..."
xcrun simctl shutdown all >/dev/null 2>&1
osascript -e 'quit app "Simulator"' >/dev/null 2>&1
sleep 1
pgrep -f Simulator >/dev/null && pkill -f Simulator && \
  _color_echo green "✅ 已彻底关闭模拟器" || \
  _color_echo green "✅ 模拟器已关闭"

# ✅ Homebrew 自检
if ! command -v brew &>/dev/null; then
  _color_echo yellow "🧩 未检测到 Homebrew，正在安装..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    _color_echo red "❌ Homebrew 安装失败"
    exit 1
  }
  _color_echo green "✅ Homebrew 安装成功"
else
  _color_echo blue "🔄 Homebrew 已安装，更新中..."
  brew update && brew upgrade
  _color_echo green "✅ Homebrew 已更新"
fi

# ✅ fzf 自检
if ! command -v fzf &>/dev/null; then
  _color_echo yellow "🧩 未检测到 fzf，安装中..."
  brew install fzf || {
    _color_echo red "❌ fzf 安装失败"
    exit 1
  }
  _color_echo green "✅ fzf 安装成功"
else
  _color_echo blue "🔄 fzf 已安装，升级中..."
  brew upgrade fzf
  _color_echo green "✅ fzf 已是最新版"
fi

# ✅ 开始循环
while true; do
  echo ""
  _color_echo yellow "📌 如果你想复制上面命令，请现在复制完再按回车继续..."
  read "?⏸️ 按回车继续选择设备和系统："

  # ✅ 获取设备类型
  _color_echo blue "📦 获取可用设备类型..."
  device_options=("${(@f)$(xcrun simctl list devicetypes |
    grep '^iPhone' |
    sed -E 's/^(.+) \((.+)\)$/📱 \1|\2/')}")

  [[ ${#device_options[@]} -eq 0 ]] && _color_echo red "❌ 未找到设备类型" && exit 1

  selected_device_display=$(printf "%s\n" "${device_options[@]}" |
    cut -d'|' -f1 |
    fzf --prompt="👉 选择设备型号 > " --height=40% --reverse)

  [[ -z "$selected_device_display" ]] && _color_echo yellow "⚠️ 未选择设备，正在退出..." && exit 0

  for entry in "${device_options[@]}"; do
    [[ "${entry%%|*}" == "$selected_device_display" ]] && selected_device_id="${entry##*|}" && break
  done

  _color_echo green "✅ 你选择的设备是：$selected_device_display"
  _color_echo green "🔗 设备 ID：$selected_device_id"
  echo ""

  # ✅ 获取 Runtime
  _color_echo blue "🧬 获取可用系统版本..."
  runtime_options=("${(@f)$(xcrun simctl list runtimes |
    grep "iOS" |
    grep -v "unavailable" |
    sed -En 's/^.*(iOS [0-9.]+) \([^)]+\) - (com\.apple\.CoreSimulator\.SimRuntime\.[^)]+).*$/🧬 \1|\2/p')}")

  [[ ${#runtime_options[@]} -eq 0 ]] && _color_echo red "❌ 未找到 Runtime" && exit 1

  selected_runtime_display=$(printf "%s\n" "${runtime_options[@]}" |
    cut -d'|' -f1 |
    fzf --prompt="👉 选择系统版本 > " --height=40% --reverse)

  [[ -z "$selected_runtime_display" ]] && _color_echo yellow "⚠️ 未选择系统版本，正在退出..." && exit 0

  for entry in "${runtime_options[@]}"; do
    [[ "${entry%%|*}" == "$selected_runtime_display" ]] && selected_runtime_id="${entry##*|}" && break
  done

  _color_echo green "🧬 你选择的系统版本是：$selected_runtime_display"
  _color_echo green "🔗 Runtime ID：$selected_runtime_id"
  echo ""

  # ✅ 创建模拟器
  sim_name="MySim_$(date +%s | tail -c 6)"
  _color_echo blue "🚀 正在创建模拟器 $sim_name ..."
  sim_create_output=$(xcrun simctl create "$sim_name" "$selected_device_id" "$selected_runtime_id" 2>&1)

  if [[ "$sim_create_output" == *"Unable to create a device for device type"* ]]; then
    device_name="${selected_device_display#📱 }"
    system_name="${selected_runtime_display#🧬 }"

    _color_echo red "❌ 创建失败：该组合不受支持"
    _color_echo yellow "💡 设备：$device_name"
    _color_echo yellow "💡 系统：$system_name"
    echo ""
    _color_echo green "📋 请尝试以下操作以手动启动模拟器："
    _color_echo green "🔍 查找设备：xcrun simctl list devices | grep '$device_name'"
    _color_echo green "🚀 启动设备：xcrun simctl boot \"$device_name\""
    _color_echo green "🖥️ 打开 GUI：open -a Simulator"
    echo ""
    _color_echo green "💡 如果模拟器没有显示，请执行以下命令处理假后台："
    _color_echo green "xcrun simctl shutdown all >/dev/null 2>&1"
    _color_echo green "osascript -e 'quit app \"Simulator\"' >/dev/null 2>&1"
    _color_echo green "sleep 1"
    _color_echo green "pgrep -f Simulator >/dev/null && pkill -f Simulator"
    _color_echo green "open -a Simulator"
    _color_echo green "iOS 模拟器实例化的目录：~/Library/Developer/CoreSimulator/Devices/"
    
    echo ""
    _color_echo yellow "🔁 请重新选择有效的设备与系统组合..."
    sleep 2
    continue
  elif [[ -z "$sim_create_output" ]]; then
    _color_echo red "❌ 模拟器创建失败（未知错误）"
    sleep 1
    continue
  else
    sim_id="$sim_create_output"
    _color_echo green "✅ 模拟器创建成功：$sim_name"
    _color_echo green "🆔 模拟器 ID：$sim_id"
    _color_echo yellow "🚀 启动模拟器中..."
    xcrun simctl boot "$sim_id" >/dev/null 2>&1
    open -a Simulator
    _color_echo green "✅ 模拟器已打开：$sim_name"
    break
  fi

done

exit 0
