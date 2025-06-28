#!/bin/sh
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

print_message() {
    echo "\033[31m$1\033[0m"
}

print_intro() {
    echo ""
    echo "=============================="
    echo "📦 本脚本功能如下："
    echo "1️⃣ 自动检测并安装 npm、json-server、fzf（如未安装）"
    echo "2️⃣ 自动升级 json-server 到最新版本（如可用）"
    echo "3️⃣ 支持拖入 .json 文件或目录，或回车递归扫描当前目录"
    echo "4️⃣ 使用 fzf 选择 JSON 文件作为 REST 数据源"
    echo "5️⃣ 自动检测端口占用，从 3000 起递增"
    echo "6️⃣ 自动生成 config.js 提供端口变量给 HTML 使用"
    echo "7️⃣ 自动打开浏览器访问 REST 服务"
    echo "=============================="
    echo ""
    read -p "👉 按下回车继续执行，或 Ctrl+C 退出..."
}

get_current_directory() {
    current_directory=$(dirname "$(readlink -f "$0")")
    print_message "📂 当前路径为: $current_directory"
    cd "$current_directory"
}

check_brew() {
    if ! command -v brew >/dev/null 2>&1; then
        print_message "🍺 未检测到 Homebrew，正在安装..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        print_message "✅ Homebrew 已安装"
    fi
}

check_npm() {
    if ! command -v npm >/dev/null 2>&1; then
        print_message "📦 未检测到 npm，正在通过 Homebrew 安装 Node.js..."
        brew install node
    else
        print_message "✅ npm 已检测到"
    fi
}

check_json_server() {
    if ! command -v json-server >/dev/null 2>&1; then
        print_message "🧰 未检测到 json-server，开始安装..."
        npm install -g json-server
    else
        print_message "🔄 json-server 已安装，检查版本..."
        latest=$(npm show json-server version)
        current=$(npm list -g json-server --depth=0 2>/dev/null | grep json-server | awk -F@ '{print $2}')
        if [ "$latest" != "$current" ]; then
            print_message "⬆️ 更新 json-server：$current → $latest"
            npm install -g json-server@latest
        else
            print_message "✅ json-server 已是最新版本：$current"
        fi
    fi
}

check_fzf() {
    if ! command -v fzf >/dev/null 2>&1; then
        print_message "🧭 未检测到 fzf，正在安装..."
        brew install fzf
    else
        print_message "✅ fzf 已安装"
    fi
}

find_available_port() {
    port=3000
    while lsof -i tcp:$port >/dev/null 2>&1; do
        echo "⚠️ 端口 $port 被占用，尝试下一个..."
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
                print_message "❌ 所选文件夹下未找到 .json 文件"
                exit 1
            fi
            selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 20 --reverse --border)
        else
            print_message "❌ 无效路径：不是 .json 文件或文件夹"
            exit 1
        fi
    else
        json_files=($(find . -type f -name "*.json" 2>/dev/null))
        if [ ${#json_files[@]} -eq 0 ]; then
            print_message "❌ 当前目录及子目录中没有找到 .json 文件"
            exit 1
        fi
        selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 20 --reverse --border)
    fi

    if [ -z "$selected_file" ]; then
        print_message "⚠️ 未选择任何文件"
        exit 0
    fi

    print_message "✅ 您选择了: $selected_file"

    json_server_path=$(command -v json-server)
    if [ ! -x "$json_server_path" ]; then
        print_message "❌ 找不到 json-server 可执行文件"
        exit 1
    fi

    selected_port=$(find_available_port | tail -n1)
    echo "🚀 启动 json-server，监听端口: $selected_port"

    echo "const JSON_SERVER_PORT = $selected_port;" > config.js
    echo "📄 已生成 config.js 用于 post_form.html 引用"

    "$json_server_path" "$selected_file" --port "$selected_port" &
    sleep 1
    open "http://localhost:$selected_port/"
}

main() {
    print_intro
    get_current_directory
    check_brew
    check_npm
    check_json_server
    check_fzf
    select_json_file
    print_message "👋 关闭窗口后，json-server 将自动退出"
}

main
