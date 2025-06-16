#!/bin/bash
# 放在 .git 文件夹同级
set -e

# 强制切换到脚本所在目录（假设就在项目根目录）
cd "$(dirname "$0")"

# 获取当前目录下的 .xcodeproj 名称（去掉后缀）
project_file=$(find . -maxdepth 1 -name "*.xcodeproj" | head -n 1)

if [[ -z "$project_file" ]]; then
  echo "❌ 没有找到 .xcodeproj 文件"
  exit 1
fi

project_name=$(basename "$project_file" .xcodeproj)
echo "📁 项目名: $project_name"

# 获取当前用户名
user_name=$(whoami)

# 构建 DerivedData 目录路径
derived_data_dir="/Users/$user_name/Library/Developer/Xcode/DerivedData"

# 查找匹配的 DerivedData 子目录（可能有 hash 后缀，模糊匹配）
project_dir=$(find "$derived_data_dir" -type d -name "${project_name}-*" | head -n 1)

if [[ -z "$project_dir" ]]; then
  echo "❌ 没有在 DerivedData 中找到项目目录"
  exit 1
fi

# 组合成最终的 SourcePackages/checkouts 路径
spm_checkouts_dir="$project_dir/SourcePackages/checkouts"

if [[ -d "$spm_checkouts_dir" ]]; then
  echo "✅ 打开 Swift Package 目录: $spm_checkouts_dir"
  open "$spm_checkouts_dir"
else
  echo "❌ 没有找到 SourcePackages/checkouts 目录"
  exit 1
fi
