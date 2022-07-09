package com.coopelife.croissant.android.ui.screen.home

import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import com.coopelife.croissant.android.ui.mockPlanList
import com.google.accompanist.pager.ExperimentalPagerApi
import com.google.accompanist.pager.rememberPagerState

@ExperimentalPagerApi
@Composable
internal fun HomeScreen(
    nacController: NavController,
    viewModel: HomeViewModel = viewModel()
) {
    val previewText: String by viewModel.previewText.observeAsState("")
    val pagerState = rememberPagerState(mockPlanList.size)

    HomeContent(
        screenName = previewText,
        onClick = { viewModel.onButtonClicked() },
        pagerState = pagerState,
        mockPlanList,
    )
}
