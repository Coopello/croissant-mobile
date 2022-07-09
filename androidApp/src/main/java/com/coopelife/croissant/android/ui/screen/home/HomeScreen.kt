package com.coopelife.croissant.android.ui.screen.home

import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
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
    val pagerState = rememberPagerState(mockPlanList.size)

    HomeContent(
        screenName = String(),
        onClick = {},
        pagerState = pagerState,
        mockPlanList,
    )
}
