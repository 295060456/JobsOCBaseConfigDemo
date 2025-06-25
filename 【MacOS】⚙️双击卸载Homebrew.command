#!/bin/sh

echo ""
echo "===================================================================="
echo "🧨 脚本功能说明："
echo "✅ 完整卸载 Homebrew（包括 Intel/M 系统安装路径）"
echo "✅ 删除所有 Homebrew 缓存、软件、配置路径"
echo "✅ 修复残留 Git HEAD 错误问题"
echo "===================================================================="
echo ""

read -p "⚠️ 确定要卸载 Homebrew？请输入 yes 开始执行：" confirm

if [[ "$confirm" != "yes" ]]; then
  echo "❎ 已取消卸载操作"
  exit 0
fi

echo "🧨 正在卸载 Homebrew..."

# 1. 尝试 untap & 清理
brew untap homebrew/core || true
brew cleanup || true

# 2. 官方卸载脚本（HEAD 版）
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

# 3. 手动删除常见路径（Intel 和 M 系）
sudo rm -rf /usr/local/Caskroom/
sudo rm -rf /usr/local/Frameworks/
sudo rm -rf /usr/local/Homebrew/
sudo rm -rf /usr/local/bin/
sudo rm -rf /usr/local/etc/
sudo rm -rf /usr/local/include/
sudo rm -rf /usr/local/lib/
sudo rm -rf /usr/local/opt/
sudo rm -rf /usr/local/sbin/
sudo rm -rf /usr/local/share/
sudo rm -rf /usr/local/var/
sudo rm -rf /opt/homebrew/

# 4. 修复 fatal: Could not resolve HEAD 错误
brew_repo=$(brew --repo homebrew/core 2>/dev/null)
if [[ -n "$brew_repo" ]]; then
  sudo rm -rf "$brew_repo"
fi

echo ""
echo "✅ Homebrew 已彻底卸载完成"
