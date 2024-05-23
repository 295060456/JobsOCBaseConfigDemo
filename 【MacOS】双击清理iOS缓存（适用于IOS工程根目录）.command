#!/bin/sh

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo "\033[31m当前文件路径为：\033[0m $current_directory"
# cd $current_directory/ios
cd $current_directory

# 检查有没有Podfile.lock
if [ -f Podfile.lock ]; then
    rm Podfile.lock
fi

# 检查并删除Pods文件夹
if [ -d Pods ]; then
    rm -rf Pods
fi

# 检查并删除Runner.xcworkspace文件
if [ -d Runner.xcworkspace ]; then
    rm -rf Runner.xcworkspace
fi

# 清除本地缓存的所有 Pod
pod cache clean --all
# 只更新本地库
pod repo update
# 安装库到项目
pod install
