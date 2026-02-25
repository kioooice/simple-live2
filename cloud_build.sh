#!/bin/bash
# 云构建专用脚本

echo "========================================"
echo "Simple Live Android 云构建脚本"
echo "========================================"

# 进入项目目录
cd dart_simple_live-master/simple_live_app

echo "当前目录: $(pwd)"

# 检查Flutter环境
echo "检查Flutter环境..."
flutter doctor

# 获取依赖
echo "获取项目依赖..."
flutter pub get

# 清理之前的构建
echo "清理构建缓存..."
flutter clean

# 构建Release APK
echo "开始构建Release APK..."
flutter build apk --release

# 检查构建结果
if [ -f "build/app/outputs/flutter-apk/app-release.apk" ]; then
    echo "✅ APK构建成功！"
    echo "APK位置: build/app/outputs/flutter-apk/app-release.apk"
    echo "APK大小: $(du -h build/app/outputs/flutter-apk/app-release.apk | cut -f1)"
    
    # 列出所有生成的文件
    echo "生成的文件:"
    ls -la build/app/outputs/flutter-apk/
else
    echo "❌ APK构建失败"
    echo "错误日志:"
    cat build/app/outputs/flutter-apk/build.log 2>/dev/null || echo "无详细日志文件"
    exit 1
fi