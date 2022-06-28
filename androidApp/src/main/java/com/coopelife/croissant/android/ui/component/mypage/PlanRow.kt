package com.coopelife.croissant.android.ui.component.mypage

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.IntrinsicSize
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.width
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import com.coopelife.croissant.android.ui.util.theme.CroissantTheme
import com.coopelife.croissant.data.entitiy.Plan

@Composable
internal fun PlanRow(
    plan: Plan,
    modifier: Modifier = Modifier
) {
    Row(
        modifier = modifier
    ) {
        DayOfWeekAndDayOfMonth(
            meetingTime = plan.meetingTime
        )
    }
}

@Composable
private fun PlanCard() {
}

@Composable
private fun DayOfWeekAndDayOfMonth(
    meetingTime: Long,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier
            .width(IntrinsicSize.Min)
    ) {
        Text(
            text = "月",
            textAlign = TextAlign.Center,
            style = MaterialTheme.typography.body1,
            modifier = Modifier
                .fillMaxWidth()
        )
        Text(
            text = "24",
            textAlign = TextAlign.Center,
            style = MaterialTheme.typography.body1,
            modifier = Modifier
                .fillMaxWidth()
        )
    }
}

@Preview
@Composable
fun PreviewDWADM() {
    CroissantTheme {
        PlanRow(
            plan = Plan(
                id = 0,
                shopName = "SITA",
                maxNumberOfPeople = 6,
                minNumberOfPeople = 1,
                proposerId = 0,
                participantIds = listOf(),
                meetingTime = 0L,
                status = Plan.PlanStatus.NOT_ESTABLISHED,
                meetingPlace = "中目黒駅"
            )
        )
    }
}
