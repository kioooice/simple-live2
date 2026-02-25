@echo off
echo ========================================
echo Simple Live Android 构建脚本
echo ========================================

echo 正在检查Flutter环境...
flutter doctor

echo.
echo 正在进入项目目录...
cd simple_live_app

echo.
echo 正在获取依赖...
flutter pub get

echo.
echo 正在清理旧构建文件...
flutter clean

echo.
echo 正在构建Debug APK...
flutter build apk --debug

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Debug APK构建成功！
    echo 文件位置: build\app\outputs\flutter-apk\app-debug.apk
) else (
    echo.
    echo Debug APK构建失败，请检查错误信息
    pause
    exit /b 1
)

echo.
echo 是否继续构建Release版本？(y/n)
set /p choice=
if /i "%choice%"=="y" (
    echo.
    echo 正在构建Release APK...
    flutter build apk --release
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo Release APK构建成功！
        echo 文件位置: build\app\outputs\flutter-apk\app-release.apk
    ) else (
        echo.
        echo Release APK构建失败，请检查错误信息
    )
)

echo.
echo 是否构建分离ABI版本以减小体积？(y/n)
set /p choice2=
if /i "%choice2%"=="y" (
    echo.
    echo 正在构建分离ABI版本...
    flutter build apk --split-per-abi
    
    if %ERRORLEVEL% EQU 0 (
        echo.
        echo 分离ABI版本构建成功！
        echo 文件位置: build\app\outputs\flutter-apk\
        dir build\app\outputs\flutter-apk\app-*-release.apk
    )
)

echo.
echo 构建完成！
pause