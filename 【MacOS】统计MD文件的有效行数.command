#!/bin/bash

# 红色加粗打印初始化提示
echo -e "\033[1;31m#【初始化】在需要铆定的.md文件里的合适位置写入 ：当前总行数：0 行\033[0m"

# 切换到脚本所在目录
cd "$(dirname "$0")"

echo "📂 当前工作目录: $(pwd)"
echo "🔧 开始安装 Git pre-commit 钩子..."

# 直接创建 hooks 目录（如果不存在）
mkdir -p .git/hooks

echo "📝 创建 pre-commit 钩子文件..."

# 创建 pre-commit 钩子
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/zsh
echo "🔧 正在更新 Markdown 文件中的正文行数..."
for file in $(find . -type f -name "*.md"); do
    if grep -qE "^当前总行数：[0-9]+ 行" "$file"; then
        line_count=$(grep -vE '^\s*$|^\s*#|^```' "$file" | wc -l | tr -d ' ')
        echo "📄 更新文件：$file，正文行数：$line_count 行"
        sed -i "" -E "s/^当前总行数：[0-9]+ 行/当前总行数：${line_count} 行/" "$file"
        git add "$file"
    fi
done
echo "✅ 所有 Markdown 文件的行数已更新！"
EOF

# 设置执行权限
chmod +x .git/hooks/pre-commit

echo "✅ Git pre-commit 钩子安装完成！"

# 简单验证
if [ -f ".git/hooks/pre-commit" ]; then
    echo "✅ pre-commit 文件已创建"
    ls -la .git/hooks/pre-commit
else
    echo "❌ pre-commit 文件创建失败"
fi
