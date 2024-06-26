#!/bin/bash

# 获取当前脚本文件的目录
current_directory=$(dirname "$(readlink -f "$0")")
echo "Current directory: $current_directory"

# 增加 Git 的缓冲区大小：可以尝试增加 Git 的 HTTP 缓冲区大小，以防止在传输大对象时出现问题。
git config --global http.postBuffer 524288000  # 设置缓冲区为500MB
# 将 http.maxRequestBuffer 设置为较高的值的目的是允许 Git 在通过 HTTP 与远程仓库通信时处理更大的请求。这可以帮助防止例如 "RPC failed" 和 "fatal: early EOF" 这样的错误，特别是在处理大型仓库或文件时。适用于当前用户执行的所有 Git 操作。
git config --global http.maxRequestBuffer 1048576000

# 检查是否存在Podfile文件
if [ -f "$current_directory/Podfile" ]; then
  echo "Podfile exists. Proceeding with pod install..."
  # 在新的终端中运行pod install命令
  osascript -e "tell application \"Terminal\" to do script \"cd '$current_directory' && pod install\""
else
  echo "Podfile not found. Aborting pod install."
fi
