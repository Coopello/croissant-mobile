package com.coopelife.croissant.android.ui.screen.mypage

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import com.coopelife.croissant.android.R
import com.coopelife.croissant.android.ui.component.mypage.MypageAppBar
import com.coopelife.croissant.android.ui.component.mypage.PlanRow
import com.coopelife.croissant.android.ui.component.mypage.MypageTabLayout
import com.coopelife.croissant.android.ui.component.mypage.MypageTabUiModel
import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.ui.screen.mypage.MyPageScreenEvent

@Composable
internal fun MypageContent(
    planList: List<Plan>,
    onTriggerEvent: (MyPageScreenEvent) -> Unit,
) {
    val tabUiModelList: List<MypageTabUiModel> = listOf(
        MypageTabUiModel(
            titleStringRes = R.string.mypage_tab_title_not_established,
            onClick = { onTriggerEvent(MyPageScreenEvent.OnUnFormedTabSelected) }
        ),
        MypageTabUiModel(
            titleStringRes = R.string.mypage_tab_title_established,
            onClick = { onTriggerEvent(MyPageScreenEvent.OnFormedTabSelected) }
        ),
        MypageTabUiModel(
            titleStringRes = R.string.mypage_tab_title_history,
            onClick = { onTriggerEvent(MyPageScreenEvent.OnHistoryTabSelected) }
        ),
    )
    Column {
        MypageAppBar(
            userName = "秘密結社こぺろ",
            userImageUrl = String(),
        )
        MypageTabLayout(
            tabUiModelList = tabUiModelList,
        )
        LazyColumn {
            items(count = planList.size) { index ->
                PlanRow(plan = planList[index])
            }
        }
    }
}
