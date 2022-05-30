package com.coopelife.croissant.android.ui.component.home

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.util.theme.Orange

@Composable
fun DateSelectRadioGroup() {
}

@Composable
private fun DateSelectRadioButton(
    isSelected: Boolean,
    onClick: () -> Unit,
    dateText: String,
) {
    if (isSelected)
        Box(
            modifier = Modifier
                .size(dimensionResource(R.dimen.selected_size))
                .clip(shape = CircleShape)
                .clickable { onClick() }
                .background(
                    color = Orange,
                    shape = RoundedCornerShape(dimensionResource(R.dimen.selected_corner_radius))
                ),
            contentAlignment = Alignment.Center,
        ) {
            Text(
                text = dateText,
                color = Color.White,
                style = MaterialTheme.typography.h4,
                textAlign = TextAlign.Center,
            )
        }
    else
        Box(
            modifier = Modifier
                .size(dimensionResource(R.dimen.not_selected_size))
                .clip(shape = CircleShape)
                .clickable { onClick() }
                .border(
                    width = dimensionResource(R.dimen.not_selected_border_width),
                    color = Orange,
                    shape = RoundedCornerShape(dimensionResource(R.dimen.not_selected_corner_radius))
                )
                .background(
                    color = Color.White,
                    shape = RoundedCornerShape(dimensionResource(R.dimen.not_selected_corner_radius))
                ),
            contentAlignment = Alignment.Center,
        ) {
            Text(
                text = dateText,
                color = Orange,
                style = MaterialTheme.typography.h5,
                textAlign = TextAlign.Center,
            )
        }
}

@Preview(showBackground = true)
@Composable
fun Preview() {
    Row(
        verticalAlignment = Alignment.CenterVertically,
    ) {
        DateSelectRadioButton(isSelected = true, dateText = "5/28", onClick = {})
        DateSelectRadioButton(isSelected = false, dateText = "5/29", onClick = {})
    }
}
