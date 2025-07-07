#!/bin/zsh

# ========= 通用输出 =========
_JobsPrint() {
    local COLOR="$1"
    local TEXT="$2"
    local RESET="\033[0m"
    echo "${COLOR}${TEXT}${RESET}"
}
_JobsPrint_Red()    { _JobsPrint "\033[1;31m" "$1" }
_JobsPrint_Green()  { _JobsPrint "\033[1;32m" "$1" }
_JobsPrint_Yellow() { _JobsPrint "\033[1;33m" "$1" }

# ========= 自述 =========
show_intro() {
    echo ""
    _JobsPrint_Green "📜 脚本用途说明"
    echo "--------------------------------------------"
    echo "✅ 本脚本功能如下："
    echo "1️⃣ 自动检测并安装 brew 与 fzf 工具（如未安装）"
    echo "2️⃣ 通过 fzf 选择要打开的配置文件，支持多选"
    echo "3️⃣ 默认回车代表“全部文件”，可按需选择"
    echo "4️⃣ 自动打开文件，并自动执行 source 加载"
    echo "--------------------------------------------"
    echo ""
    read "?👉 按回车开始，输入其他任意字符并回车退出： " go
    if [[ -n "$go" ]]; then
        _JobsPrint_Red "❌ 用户取消执行。已退出。"
        exit 0
    fi
}

# ========= 工具检测 =========
check_and_install_brew() {
    if ! command -v brew >/dev/null 2>&1; then
        _JobsPrint_Yellow "🔧 正在安装 Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        _JobsPrint_Green "✅ Homebrew 已安装，正在升级..."
        brew update && brew upgrade && brew cleanup
    fi
}

check_and_install_fzf() {
    if ! command -v fzf >/dev/null 2>&1; then
        _JobsPrint_Yellow "🔧 正在通过 brew 安装 fzf..."
        brew install fzf
        /opt/homebrew/opt/fzf/install --all
    else
        _JobsPrint_Green "✅ fzf 已安装，正在升级..."
        brew upgrade fzf && brew cleanup
    fi
}

# ========= 自动 source =========
source_if_exists() {
    local file="$1"
    [[ -s "$file" ]] && source "$file"
}

# ========= 主流程 =========
main() {
    show_intro
    check_and_install_brew
    check_and_install_fzf

    local options=()
    [[ -f "$HOME/.bash_profile" ]] && options+=("$HOME/.bash_profile")
    [[ -f "$HOME/.bashrc" ]]       && options+=("$HOME/.bashrc")
    [[ -f "$HOME/.zshrc" ]]        && options+=("$HOME/.zshrc")
    [[ -f "$ZSH/oh-my-zsh.sh" ]]   && options+=("$ZSH/oh-my-zsh.sh")

    if (( ${#options[@]} == 0 )); then
        _JobsPrint_Red "❌ 没有找到任何配置文件。"
        return
    fi

    _JobsPrint_Green "👇 请选择要打开的配置文件（支持多选，默认回车=全部）"

    selected=("${(@f)$(printf '%s\n' "${options[@]}" | fzf --multi --prompt "配置文件> ")}")
    [[ -z "$selected" ]] && selected=("${options[@]}")

    for file in "${selected[@]}"; do
        _JobsPrint_Yellow "🚀 正在打开：$file"
        open "$file"
        source_if_exists "$file"
    done
}

main

# ~/.bash_profile
# ~/.bashrc
# ~/.zshrc 是不同的 shell 配置文件，每个文件的优先级和作用取决于你使用的 shell 类型以及你在启动 shell 时的方式
# 以下是对它们的优先级和作用的详细说明：

# Bash Shell
# ~/.bash_profile
# 这是一个用户级的启动文件，当以登录方式启动 Bash shell 时（例如通过终端登录或者 SSH 登录时），Bash 会读取并执行 ~/.bash_profile 中的内容。
# 如果 ~/.bash_profile 不存在，Bash 会尝试读取 ~/.bash_login 或者 ~/.profile。

# ~/.bashrc
# 这是一个用户级的非登录 shell 启动文件，当启动一个非登录的 Bash shell 时（例如打开一个终端窗口或者执行一个新的 shell 命令时），Bash 会读取并执行 ~/.bashrc 中的内容。
# 通常在 ~/.bash_profile 中会有一行代码来手动加载 ~/.bashrc，以便确保登录 shell 和非登录 shell 都会执行 ~/.bashrc 中的配置。

# bash
# 复制下列代码
# if [ -f ~/.bashrc ]; then
#    source ~/.bashrc
# fi

# Zsh Shell
# ~/.zshrc
# 这是 Zsh 的配置文件，不论是登录 shell 还是非登录 shell，Zsh 启动时都会读取并执行 ~/.zshrc 中的内容。
# 对于 Zsh 而言，~/.zshrc 是主要的配置文件。

# 优先级总结
# 对于 Bash：
# 登录 shell：先执行 ~/.bash_profile，如果在 ~/.bash_profile 中有 source ~/.bashrc，则会接着执行 ~/.bashrc。
# 非登录 shell：只执行 ~/.bashrc。

# 对于 Zsh：
# 无论是登录 shell 还是非登录 shell，都只执行 ~/.zshrc。
# 根据你使用的 shell 类型和启动方式，这些文件的优先级和作用会有所不同。
# 对于大多数桌面用户来说，通常会配置 ~/.bashrc 或者 ~/.zshrc 来设置常用的环境变量和别名，而 ~/.bash_profile 则用来进行一些需要在登录时执行的初始化操作。
