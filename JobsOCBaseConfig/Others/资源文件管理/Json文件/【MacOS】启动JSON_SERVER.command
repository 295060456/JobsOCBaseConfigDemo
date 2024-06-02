#!/bin/sh

# json-server 主要用于模拟 REST API，它期望处理的是对象数组而不是字符串数组
# 因此，如果你提供的是字符串数组，它会尝试将这些字符串转换为对象，并添加 id 属性，这就导致了错误
# 为了使 json-server 正常工作，你需要将字符串数组转换为对象数组。每个对象至少应该有一个唯一的属性
# 如果确实需要处理字符串数组，可以考虑将这些字符串包装在对象中

# 不能被json-server正确读取的json格式
#{
#  "data": ["a1", "a2", "a3"]
#}

# 可以被json-server正确读取的json格式
#{
#  "data": [
#    {"id": "a1"},
#    {"id": "a2"},
#    {"id": "a3"}
#  ]
#}

# 统一的输出打印函数
print_message() {
    message=$1
    echo "\033[31m$message\033[0m"  # 红色输出
}

# 获取当前脚本文件的目录
get_current_directory() {
    current_directory=$(dirname "$(readlink -f "$0")")
    print_message "当前路径为: $current_directory"
    cd "$current_directory"
}

# 检查并安装/更新 Homebrew
check_and_update_brew() {
    if ! command -v brew &> /dev/null
    then
        print_message "Homebrew没有安装，正在安装到最新版本"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        print_message "Homebrew 已被安装，正在检查更新..."
        brew update
        # 有更新才更新
        outdated_packages=$(brew outdated)
        if [ -n "$outdated_packages" ]; then
            print_message "升级 Homebrew packages..."
            brew upgrade
        else
            print_message "Homebrew packages 已经全部升级到最新版本"
        fi
    fi
}

# 检查 npm 是否安装及其安装方式，并更新
check_and_update_npm() {
    if command -v npm &> /dev/null
    then
        npm_path=$(which npm)
        print_message "npm在这个路径下找到： $npm_path"

        if [[ $npm_path == *"/usr/local/Cellar"* || $npm_path == *"/opt/homebrew"* ]]
        then
            print_message "npm 是通过 Homebrew 安装的"
            latest_version=$(npm show npm version)
            current_version=$(npm -v)
            if [ "$latest_version" != "$current_version" ];then
                print_message "更新npm版本，从 $current_version 到 $latest_version"
                brew upgrade npm
            else
                print_message "npm 已更新到最新的版本"
            fi
        else
            print_message "npm 是通过其他方式安装的"
            latest_version=$(npm show npm version)
            current_version=$(npm -v)
            if [ "$latest_version" != "$current_version" ];then
                print_message "更新npm版本，从 $current_version 到 $latest_version"
                npm install -g npm@latest
            else
                print_message "npm 已更新到最新的版本"
            fi
        fi
    else
        print_message "npm没找到，正在安装到最新版本"
        curl -L https://www.npmjs.com/install.sh | sh
    fi
}

# 检查并安装/更新 json-server
check_and_update_json_server() {
    if ! npm list -g json-server &> /dev/null
    then
        print_message "json-server 没找到，正在安装到最新版本..."
        npm install -g json-server
    else
        latest_version=$(npm show json-server version)
        current_version=$(npm list -g json-server --depth=0 | grep json-server | awk -F@ '{print $2}')
        if [ "$latest_version" != "$current_version" ]; then
            print_message "正在更新 json-server 版本，从 $current_version 到 $latest_version"
            npm install -g json-server@latest
        else
            print_message "json-server 已经成功升级"
        fi
    fi
}

# 检查并安装/更新 fzf
check_and_update_fzf() {
    if ! command -v fzf &> /dev/null
    then
        print_message "fzf没有安装，正在安装到最新版本"
        brew install fzf
    else
        print_message "fzf 已被安装，正在检查更新..."
        brew update fzf
        # 有更新才更新
        outdated_packages=$(brew outdated fzf)
        if [ -n "$outdated_packages" ]; then
            print_message "升级 fzf..."
            brew upgrade fzf
        else
            print_message "fzf 已经是最新版本"
        fi
    fi
}

# 列出当前目录下的所有后缀名为 json 的文件，并让用户选择
select_json_file() {
    json_files=($(ls *.json 2> /dev/null))
    if [ ${#json_files[@]} -eq 0 ]; then
        print_message "在此文件夹里面，并没有找到后缀名为json的文件."
        exit 1
    fi

    selected_file=$(printf "%s\n" "${json_files[@]}" | fzf --height 10 --reverse --border)
    if [ -n "$selected_file" ]; then
        print_message "您的选择是: $selected_file"
        json-server --watch "$selected_file"
    else
        print_message "未选择任何文件"
    fi
}

# 主函数，调用其他函数
main() {
    get_current_directory

    # 提示用户是否进行更新流程
    read -r -p "是否进行更新流程？按任意键继续，按回车键跳过: " response
    if [ -n "$response" ];then
        check_and_update_brew
        check_and_update_npm
        check_and_update_json_server
        check_and_update_fzf
    else
        print_message "跳过更新流程"
    fi

    select_json_file
    print_message "关闭这个窗口，服务器结束"
    open http://localhost:3000/
}

# 调用主函数
main
