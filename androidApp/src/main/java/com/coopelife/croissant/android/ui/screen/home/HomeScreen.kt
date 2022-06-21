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
import com.coopelife.croissant.android.ui.component.home.HomeTabLayout
import com.coopelife.croissant.android.ui.component.home.PlanCardsPager
import com.coopelife.croissant.data.entitiy.Plan
import com.google.accompanist.pager.ExperimentalPagerApi
import com.google.accompanist.pager.PagerState
import com.google.accompanist.pager.rememberPagerState

@ExperimentalPagerApi
@Composable
fun HomeScreen(
    nacController: NavController,
    viewModel: HomeScreenViewModel = viewModel()
) {
    val previewText: String by viewModel.previewText.observeAsState("")
    val pagerState = rememberPagerState(mockPlanList.size)

    HomeContent(
        screenName = previewText,
        onClick = { viewModel.onButtonClicked() },
        pagerState = pagerState
    )
}

@ExperimentalPagerApi
@Composable
private fun HomeContent(screenName: String, onClick: () -> Unit, pagerState: PagerState) {
    Column {
        DateSelectRadioGroup(
            Modifier
                .padding(
                    top = dimensionResource(R.dimen.padding_16dp),
                )
        )
        HomeTabLayout(
            Modifier
                .padding(
                    top = dimensionResource(R.dimen.padding_16dp),
                    start = dimensionResource(R.dimen.padding_16dp),
                    end = dimensionResource(R.dimen.padding_16dp),
                )
        )
        PlanCardsPager(
            modifier = Modifier
                .padding(
                    vertical = dimensionResource(R.dimen.padding_16dp),
                ),
            mockPlanList,
            pagerState
        )
    }
}

private val mockPlanList = listOf(
    Plan(
        id = 0,
        shopName = "SITA",
        maxNumberOfPeople = 6,
        minNumberOfPeople = 1,
        proposerId = 0,
        participantIds = listOf(),
        meetingTime = 0L,
        status = Plan.PlanStatus.NOT_ESTABLISHED,
        meetingPlace = "中目黒駅"
    ),
    Plan(
        id = 0,
        shopName = "魚いち",
        maxNumberOfPeople = 4,
        minNumberOfPeople = 1,
        proposerId = 0,
        participantIds = listOf(),
        meetingTime = 0L,
        status = Plan.PlanStatus.NOT_ESTABLISHED,
        meetingPlace = "中目黒駅"
    ),
    Plan(
        id = 0,
        shopName = "茶ばな",
        maxNumberOfPeople = 4,
        minNumberOfPeople = 1,
        proposerId = 0,
        participantIds = listOf(),
        meetingTime = 0L,
        status = Plan.PlanStatus.NOT_ESTABLISHED,
        meetingPlace = "中目黒駅"
    ),
    Plan(
        id = 0,
        shopName = "ホルモンとく",
        maxNumberOfPeople = 4,
        minNumberOfPeople = 1,
        proposerId = 0,
        participantIds = listOf(),
        meetingTime = 0L,
        status = Plan.PlanStatus.NOT_ESTABLISHED,
        meetingPlace = "中目黒駅"
    ),
    Plan(
        id = 0,
        shopName = "まんてん",
        maxNumberOfPeople = 4,
        minNumberOfPeople = 1,
        proposerId = 0,
        participantIds = listOf(),
        meetingTime = 0L,
        status = Plan.PlanStatus.NOT_ESTABLISHED,
        meetingPlace = "中目黒駅"
    ),
    Plan(
        id = 0,
        shopName = "Coopello",
        maxNumberOfPeople = 3,
        minNumberOfPeople = 1,
        proposerId = 0,
        participantIds = listOf(),
        meetingTime = 0L,
        status = Plan.PlanStatus.NOT_ESTABLISHED,
        meetingPlace = "世界の頂点"
    ),
)
