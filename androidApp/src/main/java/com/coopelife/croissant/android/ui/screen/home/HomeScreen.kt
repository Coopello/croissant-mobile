package com.coopelife.croissant.android.ui.screen.home

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.component.home.DateSelectRadioGroup

@Composable
fun HomeScreen(
    nacController: NavController,
    viewModel: HomeScreenViewModel = viewModel()
) {
    val previewText: String by viewModel.previewText.observeAsState("")

    HomeContent(screenName = previewText, onClick = { viewModel.onButtonClicked() })
}

@Composable
private fun HomeContent(screenName: String, onClick: () -> Unit) {
    Column(modifier = Modifier.padding(dimensionResource(R.dimen.padding_16dp))) {
        DateSelectRadioGroup()
    }
}
