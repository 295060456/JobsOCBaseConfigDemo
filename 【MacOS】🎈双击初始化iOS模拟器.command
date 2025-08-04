#!/bin/zsh

# ✅ 日志输出函数
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
print_banner() {
  highlight_echo "═════════════════════════════════════════════════════════════════════"
  highlight_echo "📱 iOS 模拟器创建器 - 使用 fzf 选择设备与系统版本"
  highlight_echo "═════════════════════════════════════════════════════════════════════"
}
  
# ✅ 彻底关闭所有模拟器
shutdown_simulators() {
  warn_echo "🛑 正在彻底关闭所有 iOS 模拟器..."
  xcrun simctl shutdown all >/dev/null 2>&1
  osascript -e 'quit app "Simulator"' >/dev/null 2>&1
  sleep 1
  pgrep -f Simulator >/dev/null && pkill -f Simulator && success_echo "✔ 已彻底关闭模拟器" || success_echo "✔ 模拟器已关闭"
}

# ✅ 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
  [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 🍺 Homebrew（自动架构判断）
install_homebrew() {
  arch=$(get_cpu_arch)
  if ! command -v brew &>/dev/null; then
    _color_echo yellow "🧩 未检测到 Homebrew，正在安装 ($arch)..."
    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败"
        exit 1
      }
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        _color_echo red "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
    fi
    _color_echo green "✅ Homebrew 安装成功"
  else
    _color_echo blue "🔄 Homebrew 已安装，更新中..."
    brew update && brew upgrade && brew cleanup
    _color_echo green "✅ Homebrew 已更新"
  fi
}

# ✅ 自检安装 Homebrew.fzf
install_fzf() {
  if ! command -v fzf &>/dev/null; then
    method=$(fzf_select "通过 Homebrew 安装" "通过 Git 安装")
    case $method in
      *Homebrew*) brew install fzf;;
      *Git*)
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
        ;;
      *) err "❌ 取消安装 fzf";;
    esac
  else
    _color_echo blue "🔄 fzf 已安装，升级中..."
    brew upgrade fzf
    _color_echo green "✅ fzf 已是最新版"
  fi
}

select_device_type() {
  info_echo "📦 获取可用设备类型..."
  device_options=("${(@f)$(xcrun simctl list devicetypes | grep '^iPhone' | sed -E 's/^(.+) \((.+)\)$/📱 \1|\2/')}")
  [[ ${#device_options[@]} -eq 0 ]] && error_echo "❌ 未找到设备类型" && exit 1

  selected_device_display=$(printf "%s\n" "${device_options[@]}" | cut -d'|' -f1 | fzf --prompt="👉 选择设备型号 > " --height=40% --reverse)
  [[ -z "$selected_device_display" ]] && warn_echo "⚠️ 未选择设备，正在退出..." && exit 0

  for entry in "${device_options[@]}"; do
    [[ "${entry%%|*}" == "$selected_device_display" ]] && selected_device_id="${entry##*|}" && break
  done

  success_echo "✔ 你选择的设备是：$selected_device_display"
  success_echo "🔗 设备 ID：$selected_device_id"
}

select_runtime() {
  info_echo "🧬 获取可用系统版本..."
  runtime_options=("${(@f)$(xcrun simctl list runtimes | grep "iOS" | grep -v "unavailable" | sed -En 's/^.*(iOS [0-9.]+) \([^)]+\) - (com\.apple\.CoreSimulator\.SimRuntime\.[^)]+).*$/🧬 \1|\2/p')}")
  [[ ${#runtime_options[@]} -eq 0 ]] && error_echo "❌ 未找到 Runtime" && exit 1

  selected_runtime_display=$(printf "%s\n" "${runtime_options[@]}" | cut -d'|' -f1 | fzf --prompt="👉 选择系统版本 > " --height=40% --reverse)
  [[ -z "$selected_runtime_display" ]] && warn_echo "⚠️ 未选择系统版本，正在退出..." && exit 0

  for entry in "${runtime_options[@]}"; do
    [[ "${entry%%|*}" == "$selected_runtime_display" ]] && selected_runtime_id="${entry##*|}" && break
  done

  success_echo "✔ 你选择的系统版本是：$selected_runtime_display"
  success_echo "🔗 Runtime ID：$selected_runtime_id"
}

create_and_boot_simulator() {
  device_name="${selected_device_display#📱 }"
  datetime=$(date "+%Y.%m.%d %H:%M:%S")
  sim_name="${device_name}@${datetime}"
  info_echo "🚀 正在创建模拟器 $sim_name ..."
  sim_create_output=$(xcrun simctl create "$sim_name" "$selected_device_id" "$selected_runtime_id" 2>&1)

  if [[ "$sim_create_output" == *"Unable to create a device for device type"* ]]; then
    error_echo "❌ 创建失败：该组合不受支持"
    note_echo "💡 设备：$device_name"
    note_echo "💡 系统：${selected_runtime_display#🧬 }"
    warm_echo "🔁 请重新选择有效组合..."
    sleep 2
    return 1
  elif [[ -z "$sim_create_output" ]]; then
    error_echo "❌ 模拟器创建失败（未知错误）"
    sleep 1
    return 1
  else
    sim_id="$sim_create_output"
    success_echo "✔ 模拟器创建成功：$sim_name"
    success_echo "🆔 模拟器 ID：$sim_id"
    info_echo "🚀 启动模拟器中..."
    xcrun simctl boot "$sim_id" >/dev/null 2>&1
    open -a Simulator
    success_echo "✅ 模拟器已打开：$sim_name"
    return 0
  fi
}

# ✅ 启动交互式模拟器创建循环
interactive_simulator_creation_loop() {
  while true; do
    echo ""
    note_echo "📌 如果你想复制上面命令，请现在复制完再按回车继续..."
    read "?⏸️ 按回车继续选择设备和系统："

    select_device_type             # ✅ 选择设备型号
    echo ""
    select_runtime                 # ✅ 选择系统版本
    echo ""

    create_and_boot_simulator && break  # ✅ 创建成功则退出循环，否则重新选择
  done
}

# ✅ 主函数入口
main() {
    print_banner                            # ✅ 自述信息
    shutdown_simulators                     # ✅ 彻底关闭所有模拟器
    install_homebrew                        # ✅ 自检安装 🍺 Homebrew（自动架构判断）
    install_fzf                             # ✅ 自检安装 Homebrew.fzf
    interactive_simulator_creation_loop     # ✅ 启动交互式模拟器创建循环
}

main "$@"
