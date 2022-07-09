package com.coopelife.croissant.android.ui.component.mypage

import androidx.compose.foundation.Image
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.res.painterResource
import coil.compose.rememberImagePainter
import com.coopelife.croissant.android.R

@Composable
internal fun CoilImage(
    contentDescription: String,
    modifier: Modifier = Modifier,
    imageUrl: String = String(),
) {
    val painter =
        if (imageUrl.isEmpty()) painterResource(id = R.drawable.user_icon)
        else rememberImagePainter(imageUrl)
    Image(
        painter = painter,
        contentDescription = contentDescription,
        contentScale = ContentScale.Crop,
        modifier = modifier
    )
}
