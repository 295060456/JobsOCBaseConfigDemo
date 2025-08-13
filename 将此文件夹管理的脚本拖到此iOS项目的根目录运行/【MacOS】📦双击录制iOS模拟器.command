#!/bin/zsh

# ✅ 日志与输出函数
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
print_intro() {
    clear
    echo ""
    info_echo "🎬 本脚本用于录制 iOS 模拟器视频"
    echo "👉 流程如下："
    echo "1️⃣ 选择要启动的 iOS 模拟器（fzf）"
    echo "2️⃣ 自动关闭旧模拟器防止假后台"
    echo "3️⃣ 自动启动模拟器并录屏"
    echo "4️⃣ 再次回车停止录屏"
    echo "======================================="
    read "?📎 按回车继续..."
}

inject_shellenv_block() {
    local id="$1"           # 参数1：环境变量块 ID，如 "homebrew_env"
    local shellenv="$2"     # 参数2：实际要写入的 shellenv 内容，如 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    local header="# >>> ${id} 环境变量 >>>"  # 自动生成注释头

    # 参数校验
    if [[ -z "$id" || -z "$shellenv" ]]; then
    error_echo "❌ 缺少参数：inject_shellenv_block <id> <shellenv>"
    return 1
    fi

    # 若用户未选择该 ID，则跳过写入
    if [[ ! " ${selected_envs[*]} " =~ " $id " ]]; then
    warn_echo "⏭️ 用户未选择写入环境：$id，跳过"
    return 0
    fi

    # 避免重复写入
    if grep -Fq "$header" "$PROFILE_FILE"; then
      info_echo "📌 已存在 header：$header"
    elif grep -Fq "$shellenv" "$PROFILE_FILE"; then
      info_echo "📌 已存在 shellenv：$shellenv"
    else
      echo "" >> "$PROFILE_FILE"
      echo "$header" >> "$PROFILE_FILE"
      echo "$shellenv" >> "$PROFILE_FILE"
      success_echo "✅ 已写入：$header"
    fi

    # 当前 shell 生效
    eval "$shellenv"
    success_echo "🟢 shellenv 已在当前终端生效"
}

# ✅ 检查依赖工具 🧪
# 判断芯片架构（ARM64 / x86_64）
get_cpu_arch() {
    [[ $(uname -m) == "arm64" ]] && echo "arm64" || echo "x86_64"
}

# ✅ 自检安装 Homebrew
install_homebrew() {
  local arch="$(get_cpu_arch)"                    # 获取当前架构（arm64 或 x86_64）
  local shell_path="${SHELL##*/}"                # 获取当前 shell 名称（如 zsh、bash）
  local profile_file=""
  local brew_bin=""
  local shellenv_cmd=""

  if ! command -v brew &>/dev/null; then
    warn_echo "🧩 未检测到 Homebrew，正在安装中...（架构：$arch）"

    if [[ "$arch" == "arm64" ]]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（arm64）"
        exit 1
      }
      brew_bin="/opt/homebrew/bin/brew"
    else
      arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        error_echo "❌ Homebrew 安装失败（x86_64）"
        exit 1
      }
      brew_bin="/usr/local/bin/brew"
    fi

    success_echo "✅ Homebrew 安装成功"

    # ==== 注入 shellenv 到对应配置文件（自动生效） ====
    shellenv_cmd="eval \"\$(${brew_bin} shellenv)\""

    case "$shell_path" in
      zsh)   profile_file="$HOME/.zprofile" ;;
      bash)  profile_file="$HOME/.bash_profile" ;;
      *)     profile_file="$HOME/.profile" ;;
    esac

    inject_shellenv_block "$profile_file" "$shellenv_cmd"

  else
    info_echo "🔄 Homebrew 已安装，正在更新..."
    brew update && brew upgrade && brew cleanup && brew doctor && brew -v
    success_echo "✅ Homebrew 已更新"
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

# ✅ 模拟器设备选择 📱
select_simulator_device() {
  info_echo "📱 正在获取可用 iOS 模拟器..."
  local devices=$(xcrun simctl list devices available | grep -E 'iPhone|iPad' | grep -v unavailable)
  [[ -z "$devices" ]] && error_echo "❌ 无可用模拟器" && exit 1

  info_echo "📱 请选择一个 iOS 模拟器（fzf）："
  local selected=$(echo "$devices" | fzf --height=50% --border --prompt="选择模拟器：")
  [[ -z "$selected" ]] && error_echo "❌ 未选择模拟器，操作已取消" && exit 1

  SIMULATOR_UDID=$(echo "$selected" | awk -F '[()]' '{print $2}')
  SIMULATOR_NAME=$(echo "$selected" | awk -F '[()]' '{print $1}' | sed 's/ *$//')
  success_echo "✅ 你选择的设备是：$SIMULATOR_NAME [$SIMULATOR_UDID]"
}

# ✅ 检查并关闭假后台模拟器 🧼
shutdown_fake_background_simulator() {
  info_echo "🧪 检查模拟器状态..."
  local booted=$(xcrun simctl list devices | grep "(Booted)")
  local running=$(pgrep -f Simulator)

  if [[ -z "$booted" && -n "$running" ]]; then
    warn_echo "⚠️ 检测到模拟器疑似假后台，准备强制关闭..."
    osascript -e 'quit app "Simulator"' >/dev/null 2>&1 || true
    xcrun simctl shutdown all >/dev/null 2>&1 || true
    pkill -f Simulator >/dev/null 2>&1 || true
    success_echo "✅ 假后台模拟器已关闭"
  else
    success_echo "✅ 模拟器状态正常"
  fi
}

# ✅ 启动模拟器并等待启动完成 🚀
boot_simulator() {
  info_echo "🚀 正在启动模拟器：$SIMULATOR_NAME"
  open -a Simulator --args -CurrentDeviceUDID "$SIMULATOR_UDID"

  info_echo "⏳ 等待模拟器完全启动..."
  while true; do
    booted=$(xcrun simctl list devices booted | grep "$SIMULATOR_UDID")
    [[ -n "$booted" ]] && break
    sleep 1
  done

  success_echo "✅ 模拟器已成功启动"
}

# ✅ 开始录制视频 🎥
start_recording() {
  read "?📝 请输入视频文件名（无需加 .mp4，默认 output）： " filename
  filename=${filename:-output}
  RECORD_FILE="${filename}.mp4"

  info_echo "🎥 开始录制中...（再次回车停止）"
  xcrun simctl io "$SIMULATOR_UDID" recordVideo "$RECORD_FILE" &
  RECORD_PID=$!
  read "?⏹️ 录制中，按回车停止..."
  kill -INT $RECORD_PID
  wait $RECORD_PID

  success_echo "🎉 录制完成：$RECORD_FILE"
  open "$(dirname "$RECORD_FILE")"
}

# ✅ 主函数入口 🧠
main() {
    print_intro                         # ✅ 自述信息
    install_homebrew                    # ✅ 自检安装 Homebrew
    install_fzf                         # ✅ 自检安装 Homebrew.fzf
    success_echo "✅ 必要工具已准备就绪"
    select_simulator_device             # ✅ 选择模拟器设备（fzf）
    shutdown_fake_background_simulator  # ✅ 关闭假后台模拟器
    boot_simulator                      # ✅ 启动模拟器并等待完成
    start_recording                     # ✅ 开始录制视频
}

main "$@"
