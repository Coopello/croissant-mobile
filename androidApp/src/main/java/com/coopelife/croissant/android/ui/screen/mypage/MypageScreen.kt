package com.coopelife.croissant.android.ui.screen.mypage

import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import com.coopelife.croissant.ui.screen.mypage.MyPageScreenEvent
import com.coopelife.croissant.ui.screen.mypage.MyPageScreenState

@Composable
internal fun MypageScreen(
    navController: NavController,
    viewModel: MypageViewModel = viewModel()
) {
    val state: MyPageScreenState by viewModel.state.observeAsState(MyPageScreenState.generateInitialState())

    MypageContent(
        planList = state.plans,
        onTriggerEvent = { event: MyPageScreenEvent -> viewModel.onTriggerEvent(event) }
    )
}
