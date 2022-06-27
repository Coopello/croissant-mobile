package com.coopelife.croissant.android.ui.component.mypage

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.colorResource
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.unit.dp
import com.coopelife.croissant.android.R

@Composable
fun MypageAppBar(
    userName: String,
    userImageUrl: String,
    modifier: Modifier = Modifier
) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier
            .background(colorResource(R.color.colorPrimary))
            .padding(
                vertical = dimensionResource(R.dimen.padding_16dp),
                horizontal = dimensionResource(R.dimen.padding_32dp)
            )
            .fillMaxWidth()
    ) {
        Text(
            text = userName,
            maxLines = 2,
            style = MaterialTheme.typography.h4.copy(
                color = Color.White
            ),
            modifier = Modifier
                .weight(1f)
        )
        Spacer(
            modifier = Modifier
                .size(dimensionResource(R.dimen.padding_16dp))
        )
        CoilImage(
            imageUrl = userImageUrl,
            contentDescription = userName,
            modifier = Modifier
                .size(64.dp)
                .clip(shape = CircleShape)
        )
    }
}
