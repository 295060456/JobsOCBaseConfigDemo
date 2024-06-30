#!/bin/zsh

# 全局变量声明
typeset -g CURRENT_DIRECTORY=$(dirname "$(readlink -f "$0")") # 获取当前脚本文件的目录
# 打印 "Jobs" logo
jobs_logo() {
    local logo="
JJJJJJJJ     oooooo    bb          SSSSSSSSSS
      JJ    oo    oo   bb          SS      SS
      JJ    oo    oo   bb          SS
      JJ    oo    oo   bbbbbbbbb   SSSSSSSSSS
J     JJ    oo    oo   bb      bb          SS
JJ    JJ    oo    oo   bb      bb  SS      SS
 JJJJJJ      oooooo     bbbbbbbb   SSSSSSSSSS
"
    _JobsPrint_Green "$logo"
}
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
# 自述信息
self_intro() {
    _JobsPrint_Red "【MacOS】双击清理iOS缓存（适用于IOS工程根目录）"
    _JobsPrint_Red "按回车键继续..."
    read
}
# 切换到脚本运行的当前目录
set_and_cd_to_script_dir() {
    cd "$CURRENT_DIRECTORY" || { _JobsPrint_Red "切换目录失败"; exit 1; }
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
# 切换到脚本运行的当前目录
set_and_cd_to_script_dir() {
    _JobsPrint_Green "当前文件路径为：$CURRENT_DIRECTORY"
    cd "$CURRENT_DIRECTORY" || { _JobsPrint_Red "切换目录失败"; exit 1; }
}
# 检查有没有Podfile.lock
check_Podfile_lock(){
    if [ -f Podfile.lock ]; then
        rm Podfile.lock
    fi
}
# 检查并删除Pods文件夹
delete_Pods_file(){
    if [ -d Pods ]; then
        rm -rf Pods
    fi
}
# 检查并删除Runner.xcworkspace文件
delete_Runner_xcworkspace(){
    if [ -d Runner.xcworkspace ]; then
        rm -rf Runner.xcworkspace
    fi
}
# pod 相关操作
do_pod(){
    # 清除本地缓存的所有 Pod
    pod cache clean --all
    # 只更新本地库
    pod repo update
    # 预先下载和缓存 iOS 构建所需的工具和依赖项
    flutter precache --ios
    # 安装库到项目
    pod install
}

jobs_logo # 打印 "Jobs" logo
self_intro # 自述信息
setup_git # 设置 Git 配置
check_and_set_mirror # 检查和设置镜像
set_and_cd_to_script_dir # 切换到脚本运行的当前目录
check_Podfile_lock # 检查有没有Podfile.lock
delete_Pods_file # 检查并删除Pods文件夹
delete_Runner_xcworkspace # 检查并删除Runner.xcworkspace文件
do_pod # pod 相关操作
