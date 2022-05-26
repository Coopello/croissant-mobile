package com.coopelife.croissant.android.ui.util.theme

import androidx.compose.material.Typography
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.sp
import com.coopelife.croissant.android.R

// FIXME: 不要な太さを削除
private val M1PLUS1p = FontFamily(
    Font(R.font.m_plus_1p_light, FontWeight.W300),
    Font(R.font.m_plus_1p_regular, FontWeight.W400),
    Font(R.font.m_plus_1p_medium, FontWeight.W500),
    Font(R.font.m_plus_1p_bold, FontWeight.W700),
)

val CroissantTypography = Typography(
    h1 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W400,
        fontSize = 96.sp
    ),
    h2 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W400,
        fontSize = 60.sp
    ),
    h3 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W500,
        fontSize = 48.sp
    ),
    h4 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W500,
        fontSize = 34.sp
    ),
    h5 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W500,
        fontSize = 24.sp
    ),
    h6 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W700,
        fontSize = 20.sp
    ),
    subtitle1 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W400,
        fontSize = 16.sp
    ),
    subtitle2 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W500,
        fontSize = 14.sp
    ),
    body1 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W400,
        fontSize = 16.sp
    ),
    body2 = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W400,
        fontSize = 14.sp
    ),
    button = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W500,
        fontSize = 14.sp
    ),
    caption = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W400,
        fontSize = 12.sp
    ),
    overline = TextStyle(
        fontFamily = M1PLUS1p,
        fontWeight = FontWeight.W400,
        fontSize = 10.sp
    ),
)
