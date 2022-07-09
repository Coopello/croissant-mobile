package com.coopelife.croissant.android.ui.screen.mypage

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.component.mypage.MypageAppBar
import com.coopelife.croissant.android.ui.component.mypage.PlanRow
import com.coopelife.croissant.android.ui.component.mypage.TabLayout
import com.coopelife.croissant.android.ui.component.mypage.TabUiModel
import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.ui.screen.mypage.MyPageScreenEvent

@Composable
internal fun MypageContent(
    planList: List<Plan>,
    onTriggerEvent: (MyPageScreenEvent) -> Unit,
) {
    val tabUiModelList: List<TabUiModel> = listOf(
        TabUiModel(
            titleStringRes = R.string.mypage_tab_title_not_established,
            onClick = { onTriggerEvent(MyPageScreenEvent.OnUnFormedTabSelected) }
        ),
        TabUiModel(
            titleStringRes = R.string.mypage_tab_title_established,
            onClick = { onTriggerEvent(MyPageScreenEvent.OnFormedTabSelected) }
        ),
        TabUiModel(
            titleStringRes = R.string.mypage_tab_title_history,
            onClick = { onTriggerEvent(MyPageScreenEvent.OnHistoryTabSelected) }
        ),
    )
    Column {
        MypageAppBar(
            userName = "秘密結社こぺろ",
            userImageUrl = String(),
        )
        TabLayout(
            tabUiModelList = tabUiModelList,
        )
        LazyColumn {
            items(count = planList.size) { index ->
                PlanRow(plan = planList[index])
            }
        }
    }
}
