package com.coopelife.croissant.android.ui.screen.home

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.dimensionResource
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.component.home.DateSelectRadioGroup
import com.coopelife.croissant.android.ui.component.home.HomeTabLayout
import com.coopelife.croissant.android.ui.component.home.HomeTabUiModel
import com.coopelife.croissant.android.ui.component.home.PlanCardsPager
import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.ui.screen.home.HomeScreenEvent
import com.google.accompanist.pager.ExperimentalPagerApi
import com.google.accompanist.pager.PagerState

@ExperimentalPagerApi
@Composable
internal fun HomeContent(
    screenName: String,
    onTriggerEvent: (event: HomeScreenEvent) -> Unit,
    pagerState: PagerState,
    planList: List<Plan>
) {
    val tabUiModelList: List<HomeTabUiModel> = listOf(
        HomeTabUiModel(
            titleStringRes = R.string.mypage_tab_title_not_established,
            onClick = { onTriggerEvent(HomeScreenEvent.OnUnFormedTabSelected) },
        ),
        HomeTabUiModel(
            titleStringRes = R.string.mypage_tab_title_established,
            onClick = { onTriggerEvent(HomeScreenEvent.OnFormedTabSelected) },
        ),
    )

    Column {
        DateSelectRadioGroup(
            Modifier
                .padding(
                    top = dimensionResource(R.dimen.padding_16dp),
                )
        )
        HomeTabLayout(
            tabUiModelList = tabUiModelList,
            modifier = Modifier
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
            planList,
            pagerState
        )
    }
}
