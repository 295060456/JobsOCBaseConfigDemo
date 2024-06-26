#!/bin/zsh

# 使用 echo 命令打印 Fastfile 的描述
echo "Fastfile 是一个由 Fastlane 工具使用的配置文件，主要用于自动化iOS和Android应用程序的构建和发布流程。"
echo "Fastlane 是一个非常流行的自动化工具，它可以帮助开发者自动化诸如构建、测试、版本控制和发布到应用商店等重复性任务。"
echo "在 Fastfile 中，你可以定义多个 \"lanes\"，这些 lanes 是你想要自动执行的特定任务的集合。"
echo "每个 lane 可以包括一系列的动作（actions），比如编译代码、运行测试、处理应用程序元数据、上传应用到应用商店等。"
echo "Fastfile 的主要作用："
echo "自动化构建过程：可以配置各种构建参数，自动化编译和打包应用。"
echo "自动化测试：运行自动化测试，确保应用在发布前的质量。"
echo "处理元数据：自动化处理应用商店的描述、截图等元数据。"
echo "发布应用：自动上传应用到各种平台，如 Apple App Store 或 Google Play。"
echo "简化配置：管理不同环境的配置，如开发、测试和生产环境。"
echo "集成第三方服务：如 Slack、Firebase、Sentry 等，以发送构建状态通知或部署应用。"
# 定义全局变量
CURRENT_DIRECTORY=$(dirname "$(readlink -f "$0")") # 获取当前脚本文件的目录
# 通用打印方法
_JobsPrint() {
    local COLOR="$1"
    local text="$2"
    local RESET="\033[0m"
    echo "${COLOR}${text}${RESET}"
}
# 定义红色加粗输出方法
_JobsPrint_Red() {
    _JobsPrint "\033[1;31m" "$1"
}
# 定义绿色加粗输出方法
_JobsPrint_Green() {
    _JobsPrint "\033[1;32m" "$1"
}
# 检查和设置镜像
check_and_set_mirror() {
    # 获取当前公网 IP 和地理位置信息
    local IP_INFO=$(curl -s https://ipinfo.io)
    local COUNTRY=$(echo $IP_INFO | jq -r '.country')
    _JobsPrint_Green "您的 IP 地址位于: $COUNTRY"
    # 判断当前是否在中国大陆
    if [ "$COUNTRY" = "CN" ]; then
        _JobsPrint_Red "检测到您当前在中国大陆。"
        _JobsPrint_Red "请输入 '1' 切换到清华大学镜像，或直接回车使用默认镜像："
        read user_choice
        if [ "$user_choice" = "1" ]; then
            _JobsPrint_Green "将使用清华大学镜像..."
            add_line_if_not_exists "Podfile" "source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'"
        else
            _JobsPrint_Green "将使用默认镜像..."
        fi
    else
        _JobsPrint_Green "您不在中国大陆，将使用默认镜像。"
    fi
}
# 打印 "Jobs" logo
jobs_logo() {
    local border="=="
    local width=49  # 根据logo的宽度调整
    local top_bottom_border=$(printf '%0.1s' "${border}"{1..$width})
    local logo="
||${top_bottom_border}||
||  JJJJJJJJ     oooooo    bb          SSSSSSSSSS  ||
||        JJ    oo    oo   bb          SS      SS  ||
||        JJ    oo    oo   bb          SS          ||
||        JJ    oo    oo   bbbbbbbbb   SSSSSSSSSS  ||
||  J     JJ    oo    oo   bb      bb          SS  ||
||  JJ    JJ    oo    oo   bb      bb  SS      SS  ||
||   JJJJJJ      oooooo     bbbbbbbb   SSSSSSSSSS  ||
||${top_bottom_border}||
"
    _JobsPrint_Green "$logo"
}
# 自述信息
self_intro() {
    _JobsPrint_Green "安装Cocoapods"
    _JobsPrint_Red "按回车键继续..."
    read
}
# 切换到当前目录
set_and_cd_to_script_dir() {
    # 获取并设置当前脚本文件的目录
    _JobsPrint_Green "当前目录：$CURRENT_DIRECTORY"
    # 切换到该目录
    cd "$script_dir" || { _JobsPrint_Red "切换目录失败"; exit 1; }
}
# 检查并添加行到指定的配置文件
add_line_if_not_exists() {
    local file=$1
    local line=$2
    local filepath="$HOME/$file"

    # 检查文件是否存在，如果不存在或为空，则不添加空行
    if [ ! -s "$filepath" ]; then
        echo "$line" >> "$filepath"
        _JobsPrint_Green "添加到$file：$line"
    elif ! grep -qF "$line" "$filepath"; then
        # 文件不为空，并且行不存在，先添加空行然后添加目标行
        echo '' >> "$filepath"
        echo "$line" >> "$filepath"
        _JobsPrint_Green "添加到$file：$line"
    else
        _JobsPrint_Red "$file中已存在 $line"
    fi
}
# 配置 Home.Ruby 环境变量
_brewRuby(){
    # 使用全局变量更新 HomeBrew
    add_line_if_not_exists ".bash_profile" "$HOMEBREW_PATH" # 检查并添加行到 ./bash_profile
    add_line_if_not_exists ".bashrc" "$HOMEBREW_PATH" # 检查并添加行到 ./bashrc
    add_line_if_not_exists ".zshrc" "$HOMEBREW_PATH" # 检查并添加行到 ./zshrc
    # 重新加载配置文件
    source ~/.bashrc
    source ~/.zshrc
    source ~/.bash_profile
}
# 检查并安装 Homebrew
check_homebrew() {
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if ! command -v brew &> /dev/null; then
        _JobsPrint_Red "brew 未安装，开始安装..."
        install_homebrew_normal
    else
        _JobsPrint_Green "Homebrew 已经安装，跳过安装步骤。"
        _JobsPrint_Green "检查更新 Homebrew..."
        brew update
        _JobsPrint_Green "升级 Homebrew 和由 Homebrew 管理的程序包..."
        brew upgrade
        _JobsPrint_Green "正在执行 Homebrew 清理工作..."
  
        if [ -d "/usr/local/Cellar/" ]; then
            sudo chown -R $(whoami) /usr/local/Cellar/
        fi
        if [ -d "$(brew --prefix)" ]; then
            sudo chown -R $(whoami) "$(brew --prefix)"/*
        fi
        brew cleanup
        _JobsPrint_Green "🍺🍺🍺完成更新和清理 Homebrew"
        brew doctor
        brew -v
    fi
}
# 键盘输入的方式安装 Homebrew
install_homebrew_normal() {
    echo "请选择安装方式："
    echo "1. 自定义脚本安装（可能不受官方支持）"
    echo "2. 官方脚本安装（推荐）"
    echo -n "请输入选项（1或2，按回车默认选择2）: "
    read choice

    # 如果没有输入任何内容，则默认设置为2
    if [ -z "$choice" ]; then
        choice=2
    fi

    case $choice in
    1)
        _JobsPrint_Green "正在使用自定义脚本安装 Homebrew..."
        open https://gitee.com/ineo6/homebrew-install/
        /bin/bash -c "$(curl -fsSL https://gitee.com/ineo6/homebrew-install/raw/master/install.sh)"
        _brewRuby # 写环境变量
        _JobsPrint_Green "自定义脚本安装 Homebrew 完毕。验证安装..."
        check_homebrew # 检查并安装 Homebrew
        ;;
    2)
        _JobsPrint_Green "正在使用官方脚本安装 Homebrew..."
        open https://brew.sh/
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        _brewRuby # 写环境变量
        _JobsPrint_Green "官方脚本安装 Homebrew 完毕。验证安装..."
        check_homebrew # 检查并安装 Homebrew
        ;;
    *)
        _JobsPrint_Red "无效的选项，请重新选择。"
        install_homebrew_normal
        ;;
    esac
}
# 检查并安装/更新 fzf
check_and_update_fzf() {
    # 检查fzf命令是否存在。输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if ! command -v fzf &> /dev/null; then
        _JobsPrint_Red "fzf没有安装，正在安装到最新版本"
        _JobsPrint_Green "选择安装方式："
        _JobsPrint_Green "1) 通过 Homebrew 安装"
        _JobsPrint_Green "2) 通过 Git 克隆安装"
        read -p "请输入选项 (1 或 2): " choice

        case $choice in
            1)
                check_homebrew # 检查并安装 Homebrew
                brew install fzf
                ;;
            2)
                install_fzf
                ;;
            *)
                _JobsPrint_Red "无效输入，操作取消"
                ;;
        esac
    else
        _JobsPrint_Green "fzf 已被安装，正在检查更新..."
        # 检查fzf是否通过brew安装。输出被重定向到 /dev/null，因此不会在终端显示任何内容
        if brew list fzf &> /dev/null; then
            _JobsPrint_Green "fzf is installed via Homebrew."
            # 检查是否有更新
            outdated_packages=$(brew outdated fzf)
            if [ -n "$outdated_packages" ]; then
                _JobsPrint_Green "升级 fzf..."
                brew upgrade fzf
            else
                _JobsPrint_Green "fzf 已经是最新版本"
            fi
        fi
        # 检查fzf是否通过 install_fzf 的方式进行安装的
        if [ -d "$HOME/.fzf" ] && [ -x "$HOME/.fzf/bin/fzf" ]; then
            cd "$HOME/.fzf" # 进入 fzf 安装目录
            git pull # 拉取最新的代码
            ./install # 重新运行安装脚本
        fi
    fi
}
# 检查、安装或更新 fastlane
check_install_or_update_fastlane() {
    # 检查 fastlane 是否已通过 Homebrew 安装
    # 输出被重定向到 /dev/null，因此不会在终端显示任何内容
    if brew list fastlane &>/dev/null; then
        _JobsPrint_Green "fastlane 已安装，正在检查更新..."
        brew upgrade fastlane # 更新 fastlane
        if [ $? -eq 0 ]; then
            _JobsPrint_Green "fastlane 更新成功."
        else
            _JobsPrint_Green "fastlane 已是最新版本，无需更新."
        fi
    else
        _JobsPrint_Red "fastlane 未安装，正在通过 Homebrew 安装..."
        brew install fastlane # 安装 fastlane
        fastlane init # 初始化 fastlane
        if [ $? -eq 0 ]; then
            _JobsPrint_Green "fastlane 安装成功."
        else
            _JobsPrint_Red "fastlane 安装失败."
            exit 1
        fi
    fi
}
# 用fzf来选择打开 fastlane 的方式
choose_editor_and_open() {
    local editor_choice
    _JobsPrint_Green "选择编辑器来打开 Fastfile:"
    editor_choice=$(echo -e "Xcode\nAndroid Studio\nVSCode" | fzf --height=10 --header="使用上下箭头选择编辑器，然后按回车确认")

    case $editor_choice in
        "Xcode")
            _JobsPrint_Green "正在用 Xcode 打开 Fastfile..."
            open -a Xcode Fastfile
            ;;
        "Android Studio")
            _JobsPrint_Green "正在用 Android Studio 打开 Fastfile..."
            open -a "Android Studio" Fastfile
            ;;
        "VSCode")
            _JobsPrint_Green "正在用 VSCode 打开 Fastfile..."
            code Fastfile
            ;;
        *)
            _JobsPrint_Red "未选择编辑器或选择被取消。"
            ;;
    esac
}
# 主流程
jobs_logo # 打印 "Jobs" logo
self_intro # 自述信息
set_and_cd_to_script_dir # 切换到当前目录
check_homebrew # 检查并安装 Homebrew
check_and_update_fzf # 检查并安装/更新 fzf
check_install_or_update_fastlane # 检查、安装或更新 fastlane
choose_editor_and_open # 用fzf来选择打开 fastlane 的方式
