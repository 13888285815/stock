#!/bin/bash
# 自动同步脚本 - GitHub推送

echo "========================================="
echo "🚀 开始自动同步到 GitHub"
echo "========================================="

# 切换到项目目录
cd /Users/zzx/WorkBuddy/Claw

# 检查Git状态
echo ""
echo "📊 检查文件变更..."
git status --short

# 添加所有文件
echo ""
echo "📦 添加文件到暂存区..."
git add -A

# 检查是否有变更
if git diff --cached --quiet; then
    echo "⚠️  没有文件需要提交"
    exit 0
fi

# 输入提交信息
COMMIT_MSG="${1:-Auto sync: $(date '+%Y-%m-%d %H:%M')}"
echo ""
echo "💬 提交信息: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# 推送到GitHub
echo ""
echo "📤 推送到 GitHub..."
git push origin main

echo ""
echo "✅ 同步完成！"
