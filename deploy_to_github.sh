#!/bin/bash
# Linux/Mac部署脚本

echo "========================================"
echo "Simple Live Android 部署脚本"
echo "========================================"

# 检查Git状态
echo "检查Git状态..."
git status

echo ""
read -p "是否要提交所有更改？(y/n): " commit_choice

if [[ $commit_choice =~ ^[Yy]$ ]]; then
    echo "添加所有文件..."
    git add .
    
    echo "提交更改..."
    git commit -m "Update: Simple Live Android app build configuration"
    
    echo "推送到GitHub..."
    git push origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ 代码推送成功！"
        echo ""
        echo "请访问以下链接查看构建状态："
        echo "https://github.com/你的用户名/simple-live-android/actions"
        echo ""
        echo "构建完成后，APK文件将在Actions页面的Artifacts部分提供下载"
    else
        echo ""
        echo "❌ 推送失败，请检查网络连接和Git配置"
    fi
else
    echo "已取消提交"
fi

echo ""
read -p "按回车键退出..."