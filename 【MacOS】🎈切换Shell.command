#!/bin/zsh

# ========== 用户须知 ==========
echo "
📦 本脚本用于切换当前 macOS 用户默认 Shell

🛠️ 操作流程：
1️⃣ 检查并安装 fzf
2️⃣ 列出所有可用 shell（来自 /etc/shells）
3️⃣ 让你通过 fzf 选择目标 shell
4️⃣ 自动设置为默认登录 shell（chsh -s）
"
read "k?🔑 按回车开始执行..."

# ========== 自检 fzf ==========
if ! command -v fzf >/dev/null 2>&1; then
    echo "⚠️ fzf 未安装，正在用 Homebrew 安装..."
    if ! command -v brew >/dev/null 2>&1; then
        echo "❌ Homebrew 未安装，无法继续，请手动安装 Homebrew 后重试"
        exit 1
    fi
    brew install fzf
fi

# ========== 获取所有可用 shell ==========
available_shells=($(cat /etc/shells | grep -E "^/"))

if [[ ${#available_shells[@]} -eq 0 ]]; then
    echo "❌ 无法读取可用 shell"
    exit 1
fi

# ========== fzf 选择 ==========
echo "🎯 请选择你要切换的默认 shell："
selected_shell=$(printf "%s\n" "${available_shells[@]}" | fzf --prompt="Shell ➜ ")

if [[ -z "$selected_shell" ]]; then
    echo "❌ 未选择 shell，操作取消"
    exit 1
fi

# ========== 执行切换 ==========
echo "🔧 正在切换默认 shell 为：$selected_shell"
chsh -s "$selected_shell"

# ========== 显示当前状态 ==========
echo "✅ 当前默认 shell 已更新为："
dscl . -read ~/ UserShell

echo "🎉 操作完成，建议重新打开终端以生效"
