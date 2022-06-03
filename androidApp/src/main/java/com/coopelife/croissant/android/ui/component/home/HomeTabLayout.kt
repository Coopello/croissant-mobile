package com.coopelife.croissant.android.ui.component.home

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.tooling.preview.Preview
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.util.theme.Orange
import com.coopelife.croissant.android.ui.util.theme.OrangeLight

@Composable
fun HomeTabLayout(modifier: Modifier = Modifier) {
    var tabIndex by rememberSaveable { mutableStateOf(0) }
    val tabTitleList: List<String> = listOf("未成立", "成立済")

    Box(
        modifier = modifier,
        contentAlignment = Alignment.CenterStart,
    ) {
        EllipseBackground()
        EllipseIndicator()
        TabTitle(tabTitleList = tabTitleList)
    }
}

@Composable
private fun TabTitle(tabTitleList: List<String>) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
    ) {
        tabTitleList.forEach { tabTitle: String ->
            Spacer(modifier = Modifier.weight(1f))
            Text(
                text = tabTitle,
                style = MaterialTheme.typography.h5,
                color = Color.White,
            )
            Spacer(modifier = Modifier.weight(1f))
        }
    }
}

@Composable
private fun EllipseIndicator() {
    Box(
        modifier = Modifier.padding(dimensionResource(R.dimen.home_tab_layout_ellipse_indicator_margin))
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth(0.5f)
                .height(dimensionResource(R.dimen.home_tab_layout_ellipse_indicator_height))
                .clip(shape = RoundedCornerShape(dimensionResource(R.dimen.home_tab_layout_ellipse_indicator_corner_radius)))
                .background(Orange)
        )
    }
}

@Composable
private fun EllipseBackground() {
    Box(
        modifier = Modifier
            .fillMaxWidth()
            .height(dimensionResource(R.dimen.home_tab_layout_ellipse_background_height))
            .clip(shape = RoundedCornerShape(dimensionResource(R.dimen.home_tab_layout_ellipse_background_corner_radius)))
            .background(OrangeLight)
    )
}

@Preview
@Composable
private fun TabLayoutPreview() {
    HomeTabLayout(Modifier)
}
