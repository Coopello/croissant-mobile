package com.coopelife.croissant.android.ui.component.home

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.Card
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.util.extension.fontDimensionResource
import com.coopelife.croissant.data.entitiy.Plan

@Composable
fun PlanCardsPager() {
    PlanCard(plan = mockPlan)
}

@Composable
private fun PlanCard(modifier: Modifier = Modifier, plan: Plan) {
    Card(
        shape = RoundedCornerShape(dimensionResource(R.dimen.plan_card_corner_radius)),
    ) {
        Column(
            modifier = Modifier.padding(dimensionResource(R.dimen.padding_16dp))
        ) {
            PlanItem(
                title = stringResource(R.string.plan_card_shop_name_title),
                content = plan.shopName
            )
            PlanItem(
                title = stringResource(R.string.plan_card_meeting_place_title),
                content = plan.meetingPlace
            )
            PlanItem(
                title = stringResource(R.string.plan_card_meeting_time_title),
                content = plan.meetingTime.toString()
            )
            PlanItem(
                title = stringResource(R.string.plan_card_duration_title),
                content = plan.meetingTime.toString()
            )
            PlanItem(
                title = stringResource(R.string.plan_card_number_of_people_title),
                content = "${plan.maxNumberOfPeople}にん/${plan.minNumberOfPeople}にん"
            )
            JoinButton {
                // TODO: 参加ボタンの処理を実装する
            }
        }
    }
}

@Composable
private fun PlanItem(title: String, content: String) {
    Column {
        Text(
            text = title,
            style = MaterialTheme.typography.h2.copy(
                fontSize = fontDimensionResource(R.dimen.plan_item_title_text_size),
            ),
            textAlign = TextAlign.Center,
        )
        Text(
            text = content,
            style = MaterialTheme.typography.h5.copy(
                fontSize = fontDimensionResource(R.dimen.plan_item_content_text_size),
            ),
            textAlign = TextAlign.Center,
        )
        Spacer(
            modifier = Modifier
                .height(dimensionResource(R.dimen.plan_item_spacer_height))
        )
    }
}

@Composable
private fun JoinButton(onClick: () -> Unit) {
    Button(
        onClick = onClick,
        shape = RoundedCornerShape(dimensionResource(R.dimen.join_button_corner_radius)),
    ) {
        Text(
            text = stringResource(R.string.join_button_text),
            style = MaterialTheme.typography.button.copy(
                fontSize = fontDimensionResource(R.dimen.join_button_text_size)
            ),
            textAlign = TextAlign.Center,
        )
    }
}
