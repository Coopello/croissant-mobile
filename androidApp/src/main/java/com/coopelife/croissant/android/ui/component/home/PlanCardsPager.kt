package com.coopelife.croissant.android.ui.component.home

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Button
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.tooling.preview.Preview
import com.coopelife.croissant.android.R
import com.coopelife.croissant.data.entitiy.Plan

@Composable
fun PlanCardsPager() {
}

@Composable
private fun PlanCard(modifier: Modifier = Modifier, plan: Plan) {
    Card(
        shape = RoundedCornerShape(dimensionResource(R.dimen.plan_card_corner_radius))
    ) {
        Column {
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
        Text(text = title)
        Text(text = content)
    }
}

@Composable
private fun JoinButton(onClick: () -> Unit) {
    Button(onClick = onClick) {
        Text(text = stringResource(R.string.join_button_text))
    }
}

@Preview
@Composable
fun PlanCardsPagerPreview() {
    PlanCard(
        plan = Plan(
            id = 0,
            shopName = "Coopello",
            maxNumberOfPeople = 3,
            minNumberOfPeople = 1,
            proposerId = 0,
            participantIds = listOf(),
            meetingTime = 0L,
            status = Plan.PlanStatus.NOT_ESTABLISHED,
            meetingPlace = "中目黒"
        )
    )
}
