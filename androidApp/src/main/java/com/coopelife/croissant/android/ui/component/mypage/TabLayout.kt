package com.coopelife.croissant.android.ui.component.mypage

import androidx.compose.material.Tab
import androidx.compose.material.TabRow
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.coopelife.croissant.android.R

@Composable
fun TabLayout() {
    var tabIndex by remember { mutableStateOf(0) }

    val tabTitleList: List<String> = listOf(
        stringResource(id = R.string.mypage_tab_title_not_established),
        stringResource(id = R.string.mypage_tab_title_established),
        stringResource(id = R.string.mypage_tab_title_history),
    )

    TabRow(selectedTabIndex = tabIndex) {
        tabTitleList.forEachIndexed { index: Int, title: String ->
            Tab(
                selected = tabIndex == index,
                onClick = {
                    tabIndex = index
                },
                text = {
                    Text(text = title)
                }
            )
        }
    }
}

@Preview
@Composable
fun Preview() {
    TabLayout()
}
