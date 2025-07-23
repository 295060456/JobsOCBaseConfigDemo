#!/bin/zsh
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# 🌈 通用彩色输出函数
print_colored() {
  local type="$1"
  local message="$2"
  local color
  case "$type" in
    success) color="32" ;;  # 绿色
    error)   color="31" ;;  # 红色
    warn)    color="33" ;;  # 黄色
    info)    color="36" ;;  # 青色
    *)       color="0"  ;;  # 默认
  esac
  echo "\033[${color}m${message}\033[0m"
}

# 🧾 自述
print_intro() {
  echo ""
  echo "=============================="
  echo "🛠 json-server 管理工具："
  echo "1️⃣ 自动检测并安装 fzf（如未安装）"
  echo "2️⃣ 自动检测并安装 gawk（如未安装）"
  echo "3️⃣ 已安装的工具将自动升级到最新版"
  echo "4️⃣ 自动查找当前运行的 json-server 实例"
  echo "5️⃣ 使用 fzf 显示进程供你选择"
  echo "6️⃣ 选中后自动 kill 掉该 json-server"
  echo "=============================="
  echo ""
  read "?👉 按下回车继续，或 Ctrl+C 退出..."
}

# 🍺 检查 Homebrew
check_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    print_colored error "❌ 未检测到 Homebrew，无法安装依赖。请先手动安装：https://brew.sh"
    exit 1
  else
    print_colored success "✅ Homebrew 已安装"
  fi
}

# 🧭 检查并安装/升级 fzf
check_and_install_or_upgrade_fzf() {
  if ! command -v fzf >/dev/null 2>&1; then
    print_colored info "🧭 未安装 fzf，正在安装..."
    brew install fzf
  else
    print_colored info "🔄 已安装 fzf，尝试升级..."
    brew upgrade fzf
  fi
}

# 🧠 检查并安装/升级 gawk
check_and_install_or_upgrade_gawk() {
  if ! command -v gawk >/dev/null 2>&1; then
    print_colored info "🧠 未安装 gawk，正在安装..."
    brew install gawk
  else
    print_colored info "🔄 已安装 gawk，尝试升级..."
    brew upgrade gawk
  fi
}

# 🔍 查找并杀死 json-server
find_and_kill_json_server() {
  json_server_list=$(ps aux | grep '[j]son-server' | grep -v grep)

  if [[ -z "$json_server_list" ]]; then
    print_colored info "ℹ️ 当前没有运行中的 json-server 进程。"
    return
  fi

  process_choices=$(echo "$json_server_list" | gawk '
  {
    pid=$2;
    cmd="";
    for(i=11;i<=NF;++i){ cmd=cmd $i " " };
    port="未指定端口";
    if (match(cmd, /--port[ =]?[0-9]+/)) {
      port=substr(cmd, RSTART, RLENGTH);
    }
    sub(/^.*json-server /, "", cmd);
    print pid " | " port " | " cmd
  }')

  selected=$(echo "$process_choices" | fzf --height 20 --reverse --border --prompt="🔍 选择要关闭的 json-server:")

  if [[ -z "$selected" ]]; then
    print_colored warn "❎ 未选择任何进程，已取消操作。"
    return
  fi

  pid=$(echo "$selected" | awk -F' | ' '{print $1}')

  kill "$pid" && print_colored success "✅ 已终止 json-server (PID: $pid)"
}

# 🧩 主流程
main() {
  print_intro
  check_brew
  check_and_install_or_upgrade_fzf
  check_and_install_or_upgrade_gawk
  find_and_kill_json_server
}

main
