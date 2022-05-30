package com.coopelife.croissant.android.ui.component.home

import androidx.compose.material.Tab
import androidx.compose.material.TabRow
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier

@Composable
fun HomeTabLayout(modifier: Modifier = Modifier) {
    var tabIndex by rememberSaveable { mutableStateOf(0) }
    val tabTitleList: List<String> = listOf("未成立", "成立済")
    TabRow(selectedTabIndex = tabIndex) {
        tabTitleList.forEachIndexed() { index: Int, title: String ->
            Tab(
                selected = index == tabIndex,
                onClick = { tabIndex = index },
                text = { Text(text = title) }
            )
        }
    }
}
