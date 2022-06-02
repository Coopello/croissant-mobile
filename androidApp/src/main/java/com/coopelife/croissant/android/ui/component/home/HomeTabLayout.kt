package com.coopelife.croissant.android.ui.component.home

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.util.theme.Orange

@Composable
fun HomeTabLayout(modifier: Modifier = Modifier) {
    var tabIndex by rememberSaveable { mutableStateOf(0) }
    val tabTitleList: List<String> = listOf("未成立", "成立済")
}

@Composable
private fun EllipseIndicator(width: Dp) {
    Box(
        modifier = Modifier
            .width(width = width)
            .height(dimensionResource(R.dimen.ellipse_indicator_height))
            .clip(shape = RoundedCornerShape(dimensionResource(R.dimen.ellipse_indicator_corner_radius)))
            .background(Orange)
    )
}

@Preview
@Composable
private fun TabLayoutPreview() {
    EllipseIndicator(100.dp)
}
