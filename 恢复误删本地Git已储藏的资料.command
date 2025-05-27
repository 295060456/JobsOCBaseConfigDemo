#!/bin/zsh

# 红色提示：确保脚本与 .git 文件夹在同一目录
echo "\033[31m确保该脚本与 .git 文件夹在同一目录下！\033[0m"

# 检查是否存在 .git 文件夹
if [ ! -d ".git" ]; then
  echo "❌ 错误：未在 Git 仓库根目录下运行。请确保此脚本与 .git 文件夹位于同一目录。"
  exit 1
fi

echo "🔍 正在查找所有 dangling 对象..."
git fsck --lost-found > .fsck_temp

current_branch=$(git rev-parse --abbrev-ref HEAD)
echo "✅ 当前分支：$current_branch"

mkdir -p recovered/blobs

# 恢复 commits（合并为未提交状态）
cat .fsck_temp | grep 'dangling commit' | cut -d ' ' -f 3 | while read commit_sha; do
    branch_name="recovered-commit-$commit_sha"
    echo "🔄 恢复 commit $commit_sha 为临时分支 $branch_name"
    git branch $branch_name $commit_sha

    echo "⚙️ 合并 $branch_name 到 $current_branch（不提交）"
    git merge --allow-unrelated-histories --no-commit $branch_name
done

# 恢复 trees（包装为临时 commit 后合并，不提交）
cat .fsck_temp | grep 'dangling tree' | cut -d ' ' -f 3 | while read tree_sha; do
    commit_sha=$(echo "tree $tree_sha" | git commit-tree $tree_sha -m "恢复 tree $tree_sha")
    branch_name="recovered-tree-$tree_sha"
    echo "🌲 恢复 tree $tree_sha 为临时 commit：$commit_sha（分支 $branch_name）"
    git branch $branch_name $commit_sha

    echo "⚙️ 合并 $branch_name 到 $current_branch（不提交）"
    git merge --allow-unrelated-histories --no-commit $branch_name
done

# 恢复 blobs（保存在 recovered/blobs，已 add 但不 commit）
cat .fsck_temp | grep 'dangling blob' | cut -d ' ' -f 3 | while read blob_sha; do
    filename="recovered/blobs/$blob_sha.txt"
    echo "📄 恢复 blob $blob_sha 到文件 $filename"
    git cat-file -p $blob_sha > $filename
    git add $filename
done

rm .fsck_temp

echo ""
echo "✅ 所有内容已恢复并合并到当前分支（未提交）"
echo "👉 请手动查看变更，确认无误后再执行 commit"
