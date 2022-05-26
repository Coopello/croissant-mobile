package com.coopelife.croissant.android.ui.component.home

import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun DateSelectRadioGroup() {
}

@Composable
fun DateSelectRadioButton() {
    Box(
        modifier = Modifier
            .size(100.dp)
            .clip(shape = CircleShape)
    )
}

@Preview
@Composable
fun Preview() {
    DateSelectRadioButton()
}
