#!/bin/zsh

# ✅ 彩色打印函数
print_green() { echo "\033[0;32m$1\033[0m"; }
print_red()   { echo "\033[0;31m$1\033[0m"; }
print_blue()  { echo "\033[0;34m$1\033[0m"; }

# ✅ 打印彩色 LOGO
echo ""
print_green "||=================================================||"
print_green "||  JJJJJJJJ     oooooo    bb          SSSSSSSSSS  ||"
print_green "||        JJ    oo    oo   bb          SS      SS  ||"
print_green "||        JJ    oo    oo   bb          SS          ||"
print_green "||        JJ    oo    oo   bbbbbbbbb   SSSSSSSSSS  ||"
print_green "||  J     JJ    oo    oo   bb      bb          SS  ||"
print_green "||  JJ    JJ    oo    oo   bb      bb  SS      SS  ||"
print_green "||   JJJJJJ      oooooo     bbbbbbbb   SSSSSSSSSS  ||"
print_green "||=================================================||"

# ✅ 打印功能说明
echo ""
print_blue "🛠️ 脚本功能："
print_blue "1️⃣ 删除 CocoaPods 默认 CDN 源（trunk）"
print_blue "2️⃣ 删除本地 Git 源缓存（~/.cocoapods/repos/cocoapods）"
print_blue "3️⃣ 添加 CocoaPods Git 源：https://github.com/CocoaPods/Specs.git"
echo ""
read "?👉 按下回车键继续执行，或按 Ctrl+C 取消..."

echo ""

# ✅ 删除 CDN 源 trunk
if pod repo list | grep -q "^trunk"; then
  print_green "🔍 检测到 trunk（CDN 源），正在删除..."
  pod repo remove trunk
else
  print_green "✅ 未检测到 trunk（CDN 源），无需删除"
fi

# ✅ 删除本地 Git 缓存目录
REPO_PATH="$HOME/.cocoapods/repos/cocoapods"
if [ -d "$REPO_PATH" ]; then
  print_green "🗑️ 删除本地 git 源缓存目录: $REPO_PATH"
  rm -rf "$REPO_PATH"
else
  print_green "✅ 本地 git 缓存目录不存在，无需删除"
fi

# ✅ 添加 Git 源
print_green "🔗 正在添加 Git 源 https://github.com/CocoaPods/Specs.git ..."
pod repo add cocoapods https://github.com/CocoaPods/Specs.git

# ✅ 最终提示
if [ $? -eq 0 ]; then
  print_green "🎉 CocoaPods Git 源添加成功！"
else
  print_red "❌ 添加失败，请检查网络或手动处理。"
fi
