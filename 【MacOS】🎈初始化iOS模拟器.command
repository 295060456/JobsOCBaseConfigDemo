#!/bin/zsh

# ✅ 彩色输出函数
_color_echo() {
  local color="$1"
  local message="$2"
  case "$color" in
    green)  echo "\033[32m${message}\033[0m" ;;
    red)    echo "\033[31m${message}\033[0m" ;;
    blue)   echo "\033[34m${message}\033[0m" ;;
    yellow) echo "\033[33m${message}\033[0m" ;;
    *)      echo "$message" ;;
  esac
}

# ✅ 检查 Homebrew
check_and_install_brew() {
  if ! command -v brew &>/dev/null; then
    _color_echo red "🍺 未检测到 Homebrew，正在自动安装..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    _color_echo green "✅ Homebrew 安装完成"
    export PATH="/opt/homebrew/bin:$PATH"
  else
    _color_echo green "✅ Homebrew 已安装"
  fi
}

# ✅ 检查 fzf
check_and_install_fzf() {
  if ! command -v fzf &>/dev/null; then
    _color_echo blue "🔧 正在安装 fzf..."
    brew install fzf
  else
    _color_echo green "✅ fzf 已安装"
  fi
}

# ✅ 自动清理无效模拟器
clean_invalid_simulators() {
  _color_echo blue "🧹 正在清理无效模拟器（无法 boot）..."
  boot_fail_ids=$(xcrun simctl list devices | grep -i "unavailable" | grep -oE '[A-F0-9\-]{36}')
  for id in $boot_fail_ids; do
    _color_echo yellow "🗑️ 删除无效模拟器 ID: $id"
    xcrun simctl delete "$id"
  done
  _color_echo green "✅ 无效模拟器清理完成"
}

# ✅ 初始化
check_and_install_brew
check_and_install_fzf
clean_invalid_simulators

# 📦 获取设备类型和系统
_color_echo blue "📦 获取可用设备类型..."
device_types=("${(@f)$(xcrun simctl list devicetypes | grep 'iPhone' | sed -E 's/^(.*) \((.*)\)/\2|\1/')}")

_color_echo blue "📦 获取可用 iOS 运行时..."
runtimes=("${(@f)$(xcrun simctl list runtimes | grep 'iOS' | grep -v 'unavailable' | grep -v '(null)' | sed -E 's/^(.*) \((.*)\) - (.*)/\3|\1 (\2)/')}")

# 🧩 组合设备+系统
combos=()
for d in "${device_types[@]}"; do
  for r in "${runtimes[@]}"; do
    combos+=("${d}+${r}")
  done
done

# 🎯 用户选择（逆序 + 美化 + 对齐）
selected=$(printf "%s\n" "${combos[@]}" | awk -F'[|+]' '{printf "📱 %-30s | %-30s [%s + %s]\n", $2, $4, $1, $3}' | tac | fzf --height=30% --reverse --border --prompt="📱 选择要创建的模拟器: ")

# ⛏️ 提取 ID
device_type_id=$(echo "$selected" | sed -E 's/.*\[(.*) \+ (.*)\]/\1/')
runtime_id=$(echo "$selected" | sed -E 's/.*\[(.*) \+ (.*)\]/\2/')

# 🧾 提取名称
device_name=$(echo "$selected" | awk -F'\\+' '{print $1}' | awk '{$1=$1};1')
system_line=$(echo "$selected" | awk -F'\\+' '{print $2}' | sed -E 's/\[.*//')
version=$(echo "$system_line" | sed -E 's/.*iOS ([0-9.]+) \(.*/\1/')
build=$(echo "$system_line" | sed -E 's/.*iOS [0-9.]+ \(([^)]+)\).*/\1/')
current_time=$(date "+%Y.%m.%d %H:%M")

# 🧱 模拟器名称优化
sim_name="${device_name}@${version} - ${build}@${current_time}"
_color_echo blue "🛠️ 创建模拟器: $sim_name"

# 🛑 关闭模拟器
_color_echo yellow "🛑 正在关闭所有运行中的模拟器..."
xcrun simctl shutdown all

# 🚀 创建模拟器
sim_id=$(xcrun simctl create "$sim_name" "$device_type_id" "$runtime_id")
if [ -z "$sim_id" ]; then
  _color_echo red "❌ 创建失败，请检查设备/系统是否有效"
  exit 1
fi

# 启动模拟器
open -a Simulator
sleep 2
_color_echo blue "🚀 正在启动模拟器..."
xcrun simctl boot "$sim_id" 2>/tmp/sim_boot_log.txt

if grep -q "Unable to boot device because it cannot be located on disk" /tmp/sim_boot_log.txt; then
  _color_echo red "❌ 启动失败：runtime 文件丢失，将自动清理该模拟器..."
  xcrun simctl delete "$sim_id"
  _color_echo yellow "🗑️ 模拟器 $sim_name 已被删除（ID: $sim_id）"
  exit 1
fi

_color_echo green "✅ 模拟器 $sim_name 已成功启动（ID: $sim_id）"
