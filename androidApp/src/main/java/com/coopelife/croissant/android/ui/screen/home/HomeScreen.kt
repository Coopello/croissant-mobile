package com.coopelife.croissant.android.ui.screen.home

import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import com.coopelife.croissant.ui.screen.home.HomeScreenEvent
import com.coopelife.croissant.ui.screen.home.HomeScreenState
import com.google.accompanist.pager.ExperimentalPagerApi
import com.google.accompanist.pager.rememberPagerState

@ExperimentalPagerApi
@Composable
internal fun HomeScreen(
    nacController: NavController,
    viewModel: HomeViewModel = viewModel()
) {
    val state: HomeScreenState by viewModel.state.observeAsState(HomeScreenState.generateInitialState())
    val pagerState = rememberPagerState(state.plans.size)

    HomeContent(
        screenName = String(),
        onTriggerEvent = { event: HomeScreenEvent -> viewModel.onTriggerEvent(event) },
        pagerState = pagerState,
        planList = state.plans,
        dateTextList = state.dates,
    )
}
