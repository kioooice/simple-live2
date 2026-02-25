plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

// 读取 key.properties (如果存在)
val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = java.util.Properties()
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(java.io.FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.xycz.simple_live"
    compileSdk = flutter.compileSdkVersion
    // ndkVersion = flutter.ndkVersion // 如果需要特定 NDK 版本可取消注释

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    sourceSets {
        getByName("main").java.srcDirs += "src/main/kotlin"
    }

    defaultConfig {
        applicationId = "com.xycz.simple_live"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties.getProperty("keyAlias", "androiddebugkey")
            keyPassword = keystoreProperties.getProperty("keyPassword", "android")
            storeFile = keystoreProperties.getProperty("storeFile")?.let { file(it) } ?: file("debug.keystore")
            storePassword = keystoreProperties.getProperty("storePassword", "android")
            isV1SigningEnabled = true
            isV2SigningEnabled = true
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    
    // 兼容旧版 Flutter 项目结构
    lint {
        disable.add("InvalidPackage")
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk7:1.9.0") // 确保 Kotlin 版本匹配
}