#!/bin/zsh

# 定义全局变量
typeset -g CURRENT_DIRECTORY=$(dirname "$(readlink -f "$0")") # 获取当前脚本文件的目录
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
    _JobsPrint_Green "【MacOS】Pod_Install（适用于iOS工程根目录）"
    _JobsPrint_Red "按回车键继续..."
    read
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
# 设置 Git 配置
setup_git() {
    # 增加 Git 的缓冲区大小
    git config --global http.postBuffer 524288000  # 设置缓冲区为500MB
    # 将 http.maxRequestBuffer 设置为较高的值
    # 目的是允许 Git 在通过 HTTP 与远程仓库通信时处理更大的请求。
    # 这可以帮助防止例如 "RPC failed" 和 "fatal: early EOF" 这样的错误，特别是在处理大型仓库或文件时。适用于当前用户执行的所有 Git 操作。
    git config --global http.maxRequestBuffer 1048576000  # 允许 Git 在通过 HTTP 与远程仓库通信时处理更大的请求
}
# HomeBrew 安装或升级 jq
# jq 是一个轻量级且灵活的命令行 JSON 处理器，它允许你对 JSON 数据进行各种操作，如解析、过滤、映射和转换结构化数据
install_or_upgrade_jq() {
    # 检查 jq 是否已安装
    if brew list jq &>/dev/null; then
        _JobsPrint_Green "jq 已安装，检查是否有可用的升级..."
        # 检查是否存在可用的升级
        if brew outdated | grep jq &>/dev/null; then
            _JobsPrint_Green "存在可用的升级，正在升级 jq..."
            brew upgrade jq
        else
            _JobsPrint_Green "当前 jq 已是最新版本。"
        fi
    else
        _JobsPrint_Red "jq 未安装，正在安装..."
        brew install jq
    fi
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
            add_line_if_not_exists ".bash_profile" "source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'"
        else
            _JobsPrint_Green "将使用默认镜像..."
        fi
    else
        _JobsPrint_Green "您不在中国大陆，将使用默认镜像。"
    fi
}
# 自动判断芯片架构并执行对应的 pod install
pod_install_auto() {
  echo "🔍 正在检测芯片架构..."
  ARCH_NAME="$(uname -m)"
  echo "✅ 当前架构: $ARCH_NAME"
  if [[ "$ARCH_NAME" == "arm64" ]]; then
    echo "🍎 检测到 Apple Silicon 芯片，使用 Rosetta 执行 pod install"
    arch -x86_64 pod install
  else
    echo "💻 检测到 Intel 芯片，直接执行 pod install"
    pod install
  fi
}
# 运行 pod install
run_pod_install() {
    _JobsPrint_Green "当前路径: $CURRENT_DIRECTORY"
    # 检查是否存在Podfile文件
    if [ -f "$CURRENT_DIRECTORY/Podfile" ]; then
        _JobsPrint_Green "已找到 Podfile 文件，pod install 操作开始"
        # 切换到当前目录并运行 pod install 命令
        cd "$CURRENT_DIRECTORY"
        rm -rf ~/Library/Developer/Xcode/DerivedData # 清理 Xcode 缓存并重启构建
        pod deintegrate # 让 Xcode 项目回到没有使用 CocoaPods 之前的状态。
        pod_install_auto
        _JobsPrint_Green "显示依赖关系"
        cat Podfile.lock
    else
        _JobsPrint_Red "没找到 Podfile 文件，pod install 操作自动终止"
    fi
}
# 将 .xcworkspace 文件快捷方式创建到桌面
create_xcworkspace_shortcut_to_desktop() {
    local desktop_path=~/Desktop
    local found_any=false

    for workspace in "$CURRENT_DIRECTORY"/*.xcworkspace; do
        if [ -e "$workspace" ]; then
            local basename=$(basename "$workspace")
            local link_path="$desktop_path/$basename"

            # 如果桌面上已经存在同名链接或文件，先删除
            if [ -L "$link_path" ] || [ -e "$link_path" ]; then
                _JobsPrint_Red "桌面已存在 $basename，将被覆盖..."
                rm -rf "$link_path"
            fi

            ln -s "$workspace" "$link_path"
            _JobsPrint_Green "已创建快捷方式：$basename → 桌面"
            found_any=true
        fi
    done

    if [ "$found_any" = false ]; then
        _JobsPrint_Red "未找到任何 .xcworkspace 文件，未创建快捷方式。"
    fi
}
# 主流程
main() {
    jobs_logo # 打印 "Jobs" logo
    self_intro # 自述信息
    setup_git # 设置 Git 配置
    install_or_upgrade_jq # HomeBrew 安装或升级 jq
    check_and_set_mirror # 检查和设置镜像
    run_pod_install # 运行 pod install
    create_xcworkspace_shortcut_to_desktop # 将 .xcworkspace 文件快捷方式创建到桌面
}
# 调用主函数
main
