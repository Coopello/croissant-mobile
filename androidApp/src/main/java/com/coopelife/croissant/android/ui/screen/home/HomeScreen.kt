package com.coopelife.croissant.android.ui.screen.home

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material.Button
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController

@Composable
fun HomeScreen(
    nacController: NavController,
    viewModel: HomeScreenViewModel = viewModel()
) {
    val screenName: String by viewModel.screenName.observeAsState("")

    HomeContent(screenName = screenName, onClick = { viewModel.onButtonClicked() })
}

@Composable
private fun HomeContent(screenName: String, onClick: () -> Unit) {
    Column(modifier = Modifier.padding(16.dp)) {
        Text(
            text = screenName,
            modifier = Modifier.padding(bottom = 8.dp),
            style = MaterialTheme.typography.h3
        )
        Button(onClick = onClick) {
            Text(
                text = "Click me!",
                modifier = Modifier.padding(4.dp)
            )
        }
    }
}
