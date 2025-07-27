#!/bin/sh
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

# 彩色输出封装
print_colored() {
  case "$1" in
    green) color="32" ;;  # 成功/已安装
    red) color="31" ;;    # 错误/未安装
    yellow) color="33" ;; # 警告/占用
    blue) color="34" ;;   # 普通信息
    *) color="0" ;;
  esac
  shift
  echo "\033[${color}m$*\033[0m"
}

print_success() { print_colored green "✅ $*"; }
print_error()   { print_colored red   "❌ $*"; }
print_warn()    { print_colored yellow "⚠️ $*"; }
print_info()    { print_colored blue  "$*"; }

print_intro() {
    echo ""
    echo "=============================================="
    echo "🚀 JSON Server 快速启动器（自定义接口支持）"
    echo "=============================================="
    echo "📦 本脚本具备以下功能："
    echo "1️⃣ 自动检测并安装 npm、json-server、fzf（如未安装）"
    echo "2️⃣ 自动升级 json-server 到最新版本（如有更新）"
    echo "3️⃣ 支持拖入 .json 文件或目录，或回车递归扫描当前目录"
    echo "4️⃣ 使用 fzf 多选 JSON 文件作为 REST 数据源"
    echo "5️⃣ 自动复制为 db.json，供 server.js 动态读取"
    echo "6️⃣ 自动生成 config.js，传递端口给 server.js 使用"
    echo "7️⃣ 启动自定义 server.js，支持 POST 接口（如 /getPosts）"
    echo "8️⃣ 智能检测端口占用，从 3000 起递增"
    echo "9️⃣ 自动打开浏览器访问对应端口"
    echo "🔟 支持前台调试 / 后台静默运行，灵活选择"
    echo "=============================================="
    echo ""
    read -p "👉 按下回车继续执行，或 Ctrl+C 退出..."
}

get_current_directory() {
    current_directory=$(dirname "$(readlink -f "$0")")
    print_info "📂 当前路径为: $current_directory"
    cd "$current_directory"
}

check_brew() {
    if ! command -v brew >/dev/null 2>&1; then
        print_error "未检测到 Homebrew，正在安装..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        print_success "Homebrew 已安装"
    fi
}

check_npm() {
    if ! command -v npm >/dev/null 2>&1; then
        print_error "未检测到 npm，正在通过 Homebrew 安装 Node.js..."
        brew install node
    else
        print_success "npm 已检测到"
    fi
}

check_json_server() {
    if ! command -v json-server >/dev/null 2>&1; then
        print_error "未检测到 json-server，开始安装..."
        npm install -g json-server
    else
        print_info "json-server 已安装，检查版本..."
        latest=$(npm show json-server version)
        current=$(npm list -g json-server --depth=0 2>/dev/null | grep json-server | awk -F@ '{print $2}')
        if [ "$latest" != "$current" ]; then
            print_warn "更新 json-server：$current → $latest"
            npm install -g json-server@latest
        else
            print_success "json-server 已是最新版本：$current"
        fi
    fi
}

check_fzf() {
    if ! command -v fzf >/dev/null 2>&1; then
        print_error "未检测到 fzf，正在安装..."
        brew install fzf
    else
        print_success "fzf 已安装"
    fi
}

find_available_port() {
    port=3000
    while lsof -i tcp:$port >/dev/null 2>&1; do
        print_warn "端口 $port 被占用，尝试下一个..."
        port=$((port + 1))
    done
    echo "$port"
}

select_json_file() {
    echo ""
    echo "📥 请拖入一个 .json 文件或文件夹，然后按回车（直接回车将扫描当前目录）："
    read -r input_path
    input_path="${input_path//\"/}"  # 去除路径中的引号

    if [[ -n "$input_path" ]]; then
        if [[ -f "$input_path" && "$input_path" == *.json ]]; then
            selected_file="$input_path"
        elif [[ -d "$input_path" ]]; then
            json_files=($(find "$input_path" -type f -name "*.json" 2>/dev/null))
            if [ ${#json_files[@]} -eq 0 ]; then
                print_error "所选文件夹下未找到 .json 文件"
                exit 1
            fi
            selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 20 --reverse --border)
        else
            print_error "无效路径：不是 .json 文件或文件夹"
            exit 1
        fi
    else
        json_files=($(find . -type f -name "*.json" 2>/dev/null))
        if [ ${#json_files[@]} -eq 0 ]; then
            print_error "当前目录及子目录中没有找到 .json 文件"
            exit 1
        fi
        selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 20 --reverse --border)
    fi

    if [ -z "$selected_file" ]; then
        print_warn "未选择任何文件"
        exit 0
    fi

    print_success "✅ 您选择了: $selected_file"

    cp "$selected_file" db.json
    print_success "已复制为：db.json"

    selected_port=$(find_available_port | tail -n1)
    print_info "🚀 启动 server.js，自定义接口监听端口: $selected_port"

    # 写 config.js 给 server.js 使用
    echo "const JSON_SERVER_PORT = $selected_port; module.exports = { JSON_SERVER_PORT };" > config.js
    print_success "已生成 config.js 供 server.js 引用"

    echo ""
    read -p "👉 按下回车后台运行（推荐），输入任意字符再回车则前台运行：" run_mode

    if [ -z "$run_mode" ]; then
        node server.js > /dev/null 2>&1 &
        print_success "✅ 已在后台运行 server.js（PID $!）"
        sleep 1
        open "http://localhost:$selected_port/"
        print_info "👋 可关闭终端窗口，不影响后台服务"
    else
        print_info "🔍 前台模式运行中，按 Ctrl+C 可停止服务"
        sleep 1
        open "http://localhost:$selected_port/"
        node server.js
    fi
}

main() {
    print_intro
    get_current_directory
    check_brew
    check_npm
    check_json_server
    check_fzf
    select_json_file
    print_info "👋 json-server 执行完成，如为后台运行请自行终止"
}

main
