#!/bin/bash

# 创建桌面上的Volumes文件夹（如果不存在）
mkdir -p ~/Desktop/Volumes
# 使用rsync复制目录并显示进度
sudo rsync -avh --progress /Library/Developer/CoreSimulator/Volumes/ ~/Desktop/Volumes/

echo "Volumes文件夹已成功复制到桌面。"
