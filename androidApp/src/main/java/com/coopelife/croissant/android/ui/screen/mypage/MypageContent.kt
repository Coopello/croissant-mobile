package com.coopelife.croissant.android.ui.screen.mypage

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.runtime.Composable
import com.coopelife.croissant.android.ui.component.mypage.MypageAppBar
import com.coopelife.croissant.android.ui.component.mypage.PlanRow
import com.coopelife.croissant.android.ui.component.mypage.TabLayout
import com.coopelife.croissant.data.entitiy.Plan

@Composable
internal fun MypageContent(
    previewText: String,
    onValueChanged: (String) -> Unit,
    planList: List<Plan>
) {
    Column {
        MypageAppBar(
            userName = "秘密結社こぺろ",
            userImageUrl = "https://lohas.nicoseiga.jp/thumb/946062i"
        )
        TabLayout()
        LazyColumn {
            items(count = planList.size) { index ->
                PlanRow(plan = planList[index])
            }
        }
    }
}
