package com.coopelife.croissant.android.ui.component.mypage

import androidx.compose.foundation.Image
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import coil.compose.rememberImagePainter

@Composable
internal fun CoilImage(
    imageUrl: String,
    contentDescription: String,
    modifier: Modifier = Modifier,
) {
    Image(
        painter = rememberImagePainter(imageUrl),
        contentDescription = contentDescription,
        contentScale = ContentScale.Crop,
        modifier = modifier
    )
}
