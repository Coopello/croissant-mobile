package com.coopelife.croissant.android.ui.component.mypage

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.IntrinsicSize
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.Card
import androidx.compose.material.MaterialTheme
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.util.extension.fontDimensionResource
import com.coopelife.croissant.android.ui.util.theme.CroissantTheme
import com.coopelife.croissant.data.entitiy.Plan

@Composable
internal fun PlanRow(
    plan: Plan,
    modifier: Modifier = Modifier,
) {
    Row(
        modifier = modifier
    ) {
        DayOfWeekAndDayOfMonth(
            plan = plan,
            modifier = Modifier
                .padding(
                    top = dimensionResource(R.dimen.padding_24dp),
                    start = dimensionResource(R.dimen.padding_16dp),
                    end = dimensionResource(R.dimen.padding_16dp),
                )
        )
        PlanCard(
            plan = plan,
            modifier = Modifier
                .padding(
                    top = dimensionResource(R.dimen.padding_8dp),
                    bottom = dimensionResource(R.dimen.padding_8dp),
                    end = dimensionResource(R.dimen.padding_16dp),
                )
        )
    }
}

@Composable
private fun PlanCard(
    plan: Plan,
    modifier: Modifier = Modifier,
) {
    Card(
        shape = RoundedCornerShape(dimensionResource(R.dimen.plan_card_corner_radius)),
        elevation = dimensionResource(R.dimen.card_elevation),
        modifier = modifier
            .fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .padding(dimensionResource(R.dimen.padding_16dp))
        ) {
            Text(
                text = plan.shopName,
                style = MaterialTheme.typography.h5.copy(
                    fontSize = fontDimensionResource(R.dimen.plan_item_content_text_size),
                ),
            )
            Text(
                // TODO: ハードコードを解消
                text = "14:00~15:00",
                style = MaterialTheme.typography.h2.copy(
                    fontSize = fontDimensionResource(R.dimen.plan_item_title_text_size),
                ),
            )
            val countUntilMinimumParticipants =
                if (plan.minNumberOfPeople > plan.participantIds.size) plan.minNumberOfPeople - plan.participantIds.size
                else 0
            Text(
                text = stringResource(
                    id = R.string.mypage_count_until_minimum_participants,
                    formatArgs = arrayOf(countUntilMinimumParticipants)
                )
            )
        }
    }
}

@Composable
private fun DayOfWeekAndDayOfMonth(
    plan: Plan,
    modifier: Modifier = Modifier,
) {
    Column(
        modifier = modifier
            .width(IntrinsicSize.Min)
    ) {
        Text(
            // TODO: ハードコードを解消
            text = "月",
            textAlign = TextAlign.Center,
            style = MaterialTheme.typography.body1,
            modifier = Modifier
                .fillMaxWidth()
        )
        Text(
            // TODO: ハードコードを解消
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
fun PreviewPlanRow() {
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
