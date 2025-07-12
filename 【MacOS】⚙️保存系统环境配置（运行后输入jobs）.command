#!/bin/zsh

# ✅ 彩色输出函数
print_success_path() { echo "\033[1;32m✅ 已加载配置文件：file://$1\033[0m"; }
print_warn_path()    { echo "\033[1;33m⚠️ 未找到配置文件：file://$1\033[0m"; }

# ✅ 配置文件列表
config_files=(
  "$HOME/.bash_profile"
  "$HOME/.bashrc"
  "$HOME/.zshrc"
  "$HOME/.oh-my-zsh/oh-my-zsh.sh"
)

# ✅ 函数名称
FUNC_NAME="jobs"

# ✅ 检查 ~/.zshrc 是否已定义该函数
if grep -q "^[[:space:]]*${FUNC_NAME}()" "$HOME/.zshrc"; then
  echo "ℹ️ 函数 '${FUNC_NAME}' 已存在于 ~/.zshrc，跳过写入"
else
  echo "📝 正在将 '${FUNC_NAME}' 函数写入 ~/.zshrc ..."
  cat >> ~/.zshrc <<'EOF'

# ✅ 一键重新加载常见配置文件：jobs
jobs() {
  local files=(
    "$HOME/.bash_profile"
    "$HOME/.bashrc"
    "$HOME/.zshrc"
    "$HOME/.oh-my-zsh/oh-my-zsh.sh"
  )
  for file in "${files[@]}"; do
    if [[ -f "$file" ]]; then
      source "$file"
      echo "\033[1;32m✅ 已加载配置文件：file://$file\033[0m"
    else
      echo "\033[1;33m⚠️ 未找到配置文件：file://$file\033[0m"
    fi
  done
  echo "\n📎 ⌘Command + 点击路径可打开对应文件（macOS Terminal 支持）"
}
EOF
  echo "✅ 写入完成，函数 '${FUNC_NAME}' 已添加到 ~/.zshrc"
fi

# ✅ 遍历加载配置文件并打印 file:// 可点击路径
for file in "${config_files[@]}"; do
  if [[ -f "$file" ]]; then
    source "$file"
    print_success_path "$file"
  else
    print_warn_path "$file"
  fi
done

echo ""
echo "📎 ⌘Command + 点击以上 file:// 路径可以直接打开对应文件（macOS 原生命令行支持）"
echo "📦 请执行 \033[1;36msource ~/.zshrc\033[0m 以使 '${FUNC_NAME}' 函数立即生效"
