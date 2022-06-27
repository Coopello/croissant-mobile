plugins {
    id("com.android.application")
    kotlin("android")
}

android {
    compileSdk = 32
    defaultConfig {
        applicationId = "com.coopelife.croissant.android"
        minSdk = 23
        targetSdk = 32
        versionCode = 1
        versionName = "1.0"
    }
    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
        }
    }
    buildFeatures {
        compose = true
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.1.1"
    }
    // TODO: 後で調べる
    packagingOptions {
        resources.excludes.add("META-INF/AL2.0")
        resources.excludes.add("META-INF/LGPL2.1")
    }
}

dependencies {
    implementation(project(":shared"))

    implementation("androidx.compose.ui:ui:1.1.1")

    // Tooling support (Previews, etc.)
    implementation("androidx.compose.ui:ui-tooling:1.1.1")

    // Foundation (Border, Background, Box, Image, Scroll, shapes, animations, etc.)
    implementation("androidx.compose.foundation:foundation:1.1.1")

    // Material Design
    implementation("androidx.compose.material:material:1.1.1")

    // Material design icons
    implementation("androidx.compose.material:material-icons-core:1.1.1")
    implementation("androidx.compose.material:material-icons-extended:1.1.1")

    // Integration with observables
    implementation("androidx.compose.runtime:runtime-livedata:1.1.1")

    // UI Tests
    androidTestImplementation("androidx.compose.ui:ui-test-junit4:1.1.1")

    // Bottom Navigation
    implementation("androidx.navigation:navigation-compose:2.4.2")

    // Pager
    implementation("com.google.accompanist:accompanist-pager:0.15.0")

    // kotlin coroutines
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.0-native-mt")

    // Coil
    implementation("io.coil-kt:coil-compose:2.1.0")
}
