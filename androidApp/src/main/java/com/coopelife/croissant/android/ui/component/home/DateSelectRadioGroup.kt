package com.coopelife.croissant.android.ui.component.home

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.util.extension.fontDimensionResource
import com.coopelife.croissant.android.ui.util.theme.Orange

@Composable
internal fun DateSelectRadioGroup(modifier: Modifier = Modifier) {
    var selectedIndex: Int by rememberSaveable { mutableStateOf(0) }
    val dateTextList: List<String> = listOf("12/28", "12/29", "12/30", "12/31", "1/1")
    Row(
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.SpaceEvenly,
        modifier = modifier.fillMaxWidth(),
    ) {
        dateTextList.forEachIndexed { index: Int, dateText: String ->
            DateSelectRadioButton(
                isSelected = index == selectedIndex,
                onClick = { selectedIndex = index },
                dateText = dateText
            )
        }
    }
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
                )
                .padding(dimensionResource(R.dimen.padding_4dp)),
            contentAlignment = Alignment.Center,
        ) {
            Text(
                text = dateText,
                color = Color.White,
                style = MaterialTheme.typography.h5.copy(
                    fontSize = fontDimensionResource(R.dimen.selected_font_size)
                ),
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
                )
                .padding(dimensionResource(R.dimen.padding_4dp)),
            contentAlignment = Alignment.Center,
        ) {
            Text(
                text = dateText,
                color = Orange,
                style = MaterialTheme.typography.h6.copy(
                    fontSize = fontDimensionResource(R.dimen.not_selected_font_size)
                ),
                textAlign = TextAlign.Center,
            )
        }
}

@Preview(showBackground = true)
@Composable
fun Preview() {
    DateSelectRadioGroup()
}
