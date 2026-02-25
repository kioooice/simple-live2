# Simple Live Android 云构建指南

## 🚀 快速开始

这个项目已经配置好了GitHub Actions自动构建，你可以通过以下步骤快速获得Android APK：

### 1. 准备工作
```bash
# 1. 在GitHub上创建一个新的仓库
# 2. 将本地代码推送到GitHub
git init
git add .
git commit -m "Initial commit: Simple Live Android app"
git branch -M main
git remote add origin https://github.com/你的用户名/simple-live-android.git
git push -u origin main
```

### 2. 触发构建
推送代码后，GitHub Actions会自动开始构建。你也可以手动触发：
- 访问仓库的Actions页面
- 选择"Flutter Android Build"工作流
- 点击"Run workflow"按钮

### 3. 获取APK
构建完成后：
- 在Actions页面找到对应的构建任务
- 下载生成的APK文件（名称：simple-live-android-apk）
- 或者在Releases页面找到正式发布的版本

## 📋 构建配置说明

### 环境配置
- **操作系统**: Ubuntu 20.04 LTS
- **Flutter版本**: 3.38.4 (stable)
- **Java版本**: OpenJDK 11
- **构建类型**: Release APK

### 自动化流程
1. 代码检出
2. Flutter环境设置
3. Java环境配置
4. 依赖包获取
5. APK构建
6. 成果物上传
7. GitHub Release发布（仅master/main分支）

## 🔧 本地测试构建

如果你想在本地测试构建流程：

```bash
# 给脚本执行权限
chmod +x cloud_build.sh

# 运行构建脚本
./cloud_build.sh
```

## 📱 APK信息

生成的APK特性：
- **包名**: com.xycz.simple_live
- **版本**: 1.11.4+11104
- **目标SDK**: 自动匹配最新版本
- **最小SDK**: 依据项目配置
- **架构支持**: arm64-v8a, armeabi-v7a, x86_64, x86

## ⚠️ 注意事项

1. **首次构建**可能需要5-15分钟（下载依赖）
2. **后续构建**通常3-8分钟
3. **构建失败**时检查Actions日志获取详细错误信息
4. **APK大小**预计15-30MB（包含所有媒体库）

## 🆘 故障排除

常见问题及解决方案：

### 构建失败
- 检查`pubspec.yaml`文件是否有语法错误
- 确认所有依赖包版本兼容
- 查看详细的构建日志

### APK无法安装
- 确保设备Android版本满足要求
- 检查设备存储空间
- 尝试开启"允许未知来源应用"选项

### 功能异常
- 首次运行需要网络权限
- 某些功能可能需要特定的运行时权限
- 建议在多种Android设备上测试

## 📞 支持

如有问题，请提交issue或联系项目维护者。

---
**提示**: 云构建避免了本地环境配置的复杂性，是获取生产级APK的最快方式。