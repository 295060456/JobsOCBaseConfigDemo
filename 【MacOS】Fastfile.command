#! /bin/sh

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo $current_directory
cd $current_directory

# 利用 Homebrew 安装 fastlane
brew install fastlane

# 初始化 fastlane
fastlane init

# Xcode 打开 Fastfile
open -a Xcode Fastfile

# Android Studio 打开 Fastfile
# open -a "Android Studio" Fastfile
# VSCode 打开 Fastfile
# code Fastfile