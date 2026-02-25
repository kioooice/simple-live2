@echo off
echo ========================================
echo Simple Live Android 一键部署脚本
echo ========================================

echo 正在检查Git状态...
git status

echo.
echo 是否要提交所有更改？(y/n)
set /p commit_choice=

if /i "%commit_choice%"=="y" (
    echo 正在添加所有文件...
    git add .
    
    echo 正在提交更改...
    git commit -m "Update: Simple Live Android app build configuration"
    
    echo 正在推送到GitHub...
    git push origin main
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo ✅ 代码推送成功！
        echo.
        echo 请访问以下链接查看构建状态：
        echo https://github.com/你的用户名/simple-live-android/actions
        echo.
        echo 构建完成后，APK文件将在Actions页面的Artifacts部分提供下载
    ) else (
        echo.
        echo ❌ 推送失败，请检查网络连接和Git配置
    )
) else (
    echo 已取消提交
)

echo.
echo 按任意键退出...
pause >nul