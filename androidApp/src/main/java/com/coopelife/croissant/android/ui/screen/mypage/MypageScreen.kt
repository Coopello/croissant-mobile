package com.coopelife.croissant.android.ui.screen.mypage

import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import com.coopelife.croissant.android.ui.mockPlanList

@Composable
internal fun MypageScreen(
    navController: NavController,
    viewModel: MypageViewModel = viewModel()
) {
    val previewText: String by viewModel.previewText.observeAsState("")

    MypageContent(
        previewText = previewText,
        onValueChanged = { viewModel.onValueChanged(it) },
        planList = mockPlanList,
    )
}
