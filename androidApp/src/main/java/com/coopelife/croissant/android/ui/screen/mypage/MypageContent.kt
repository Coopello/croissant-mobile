package com.coopelife.croissant.android.ui.screen.mypage

import androidx.compose.foundation.layout.Column
import androidx.compose.runtime.Composable
import com.coopelife.croissant.android.ui.component.mypage.MypageAppBar
import com.coopelife.croissant.android.ui.component.mypage.TabLayout

@Composable
internal fun MypageContent(previewText: String, onValueChanged: (String) -> Unit) {
    Column {
        MypageAppBar(
            userName = "秘密結社こぺろ",
            userImageUrl = "https://lohas.nicoseiga.jp/thumb/946062i"
        )
        TabLayout()
    }
}
