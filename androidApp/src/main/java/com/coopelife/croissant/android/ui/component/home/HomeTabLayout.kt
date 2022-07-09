package com.coopelife.croissant.android.ui.component.home

import androidx.annotation.StringRes
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.interaction.MutableInteractionSource
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.BoxWithConstraints
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.material.ripple.rememberRipple
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.Dp
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.util.extension.fontDimensionResource
import com.coopelife.croissant.android.ui.util.theme.Orange
import com.coopelife.croissant.android.ui.util.theme.OrangeLight

@Composable
internal fun HomeTabLayout(
    tabUiModelList: List<HomeTabUiModel>,
    modifier: Modifier = Modifier
) {
    var tabIndex by rememberSaveable { mutableStateOf(0) }

    BoxWithConstraints(
        modifier = modifier
            .fillMaxWidth(),
        contentAlignment = Alignment.CenterStart,
    ) {
        EllipseBackground()
        EllipseIndicator(
            width = maxWidth / tabUiModelList.size * (1 + tabIndex),
            paddingStart = maxWidth / tabUiModelList.size * tabIndex,
        )
        Row(
            modifier = Modifier.fillMaxWidth()
        ) {
            tabUiModelList.forEachIndexed { index: Int, tabUiModel: HomeTabUiModel ->
                Text(
                    text = stringResource(id = tabUiModel.titleStringRes),
                    style = MaterialTheme.typography.h5.copy(
                        fontSize = fontDimensionResource(R.dimen.home_tab_layout_title_text_size)
                    ),
                    color = Color.White,
                    textAlign = TextAlign.Center,
                    modifier = Modifier
                        .weight(1f)
                        .clickable(
                            // FIXME: Ripple を変更する
                            indication = rememberRipple(radius = dimensionResource(R.dimen.padding_0dp)),
                            interactionSource = remember { MutableInteractionSource() },
                            onClick = {
                                tabIndex = index
                                tabUiModel.onClick()
                            },
                        )
                )
            }
        }
    }
}

@Composable
private fun EllipseIndicator(width: Dp, paddingStart: Dp) {
    Box(
        modifier = Modifier
            .padding(dimensionResource(R.dimen.home_tab_layout_ellipse_indicator_margin))
    ) {
        Box(
            modifier = Modifier
                .width(width)
                .height(dimensionResource(R.dimen.home_tab_layout_ellipse_indicator_height))
                .padding(start = paddingStart)
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

internal class HomeTabUiModel(
    @StringRes val titleStringRes: Int,
    val onClick: () -> Unit,
)
