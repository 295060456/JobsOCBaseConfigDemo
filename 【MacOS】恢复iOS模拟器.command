#!/bin/bash

# 确保目标目录存在
sudo mkdir -p /Library/Developer/CoreSimulator/Volumes
# 使用rsync复制目录并显示进度
sudo rsync -avh --progress ~/Desktop/Volumes/ /Library/Developer/CoreSimulator/Volumes/

echo "桌面的Volumes文件夹内容已成功复制到/Library/Developer/CoreSimulator/Volumes。"
