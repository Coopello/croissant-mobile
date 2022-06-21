package com.coopelife.croissant.android.ui.screen.mypage

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material.MaterialTheme
import androidx.compose.material.OutlinedTextField
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.navigation.NavController
import com.coopelife.croissant.android.R

@Composable
fun MypageScreen(
    navController: NavController,
    viewModel: MypageScreenViewModel = viewModel()
) {
    val previewText: String by viewModel.previewText.observeAsState("")

    MypageContent(previewText = previewText, onValueChanged = { viewModel.onValueChanged(it) })
}

@Composable
fun MypageContent(previewText: String, onValueChanged: (String) -> Unit) {
    Column(modifier = Modifier.padding(dimensionResource(R.dimen.padding_16dp))) {
        Text(
            text = previewText,
            modifier = Modifier.padding(bottom = dimensionResource(R.dimen.padding_8dp)),
            style = MaterialTheme.typography.h3
        )
        OutlinedTextField(
            value = previewText,
            onValueChange = onValueChanged,
        )
    }
}
