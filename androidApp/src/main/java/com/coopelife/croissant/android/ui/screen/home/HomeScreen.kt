package com.coopelife.croissant.android.ui.screen.home

import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController

@Composable
fun HomeScreen(
    nacController: NavController,
    homeScreenViewModel: HomeScreenViewModel = viewModel()
) {
    val screenName: String by homeScreenViewModel.screenName.observeAsState("")
    Text(text = screenName)
}
