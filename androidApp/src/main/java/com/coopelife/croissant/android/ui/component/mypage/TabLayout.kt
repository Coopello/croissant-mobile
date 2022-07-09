package com.coopelife.croissant.android.ui.component.mypage

import androidx.annotation.StringRes
import androidx.compose.material.Tab
import androidx.compose.material.TabRow
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.res.stringResource

@Composable
internal fun TabLayout(
    tabUiModelList: List<TabUiModel>,
) {
    var tabIndex by rememberSaveable { mutableStateOf(0) }

    TabRow(selectedTabIndex = tabIndex) {
        tabUiModelList.forEachIndexed { index: Int, tabUiModel: TabUiModel ->
            Tab(
                selected = tabIndex == index,
                onClick = {
                    tabIndex = index
                    tabUiModel.onClick()
                },
                text = {
                    Text(text = stringResource(id = tabUiModel.titleStringRes))
                }
            )
        }
    }
}

internal class TabUiModel(
    @StringRes val titleStringRes: Int,
    val onClick: () -> Unit,
)
