#!/bin/bash
# 放在 .git 文件夹同级

# 获取当前文件夹路径
current_directory=$(dirname "$(realpath "$0")")
# 切换到当前目录
cd "$current_directory"
# 检查是否有已经暂存但未提交的更改
if ! git diff --cached --quiet; then
    echo "Error: There are changes staged for commit. Please unstage them before proceeding."
    exit 1
fi
# 回退到上一次提交，但保留更改到暂存区
git reset --soft HEAD^

echo "成功回退到Git本地暂存区的提交状态"
