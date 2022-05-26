package com.coopelife.croissant.android.ui.util.theme

import androidx.compose.foundation.isSystemInDarkTheme
import androidx.compose.material.MaterialTheme
import androidx.compose.material.lightColors
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color

private val LightColors = lightColors(
    primary = Orange,
    primaryVariant = OrangeDark,
    onPrimary = Color.White,
    secondary = Pink,
    secondaryVariant = PinkDark,
    onSecondary = Color.White,
    error = OrangeLight,
)

// FIXME: ダークテーマを定義する。
private val DarkColors = lightColors(
    primary = Orange,
    primaryVariant = OrangeDark,
    onPrimary = Color.White,
    secondary = Pink,
    secondaryVariant = PinkDark,
    onSecondary = Color.White,
    error = OrangeLight,
)

@Composable
fun CroissantTheme(
    darkTheme: Boolean = isSystemInDarkTheme(),
    content: @Composable () -> Unit
) {
    MaterialTheme(
        colors = if (darkTheme) DarkColors else LightColors,
        content = content,
    )
}
