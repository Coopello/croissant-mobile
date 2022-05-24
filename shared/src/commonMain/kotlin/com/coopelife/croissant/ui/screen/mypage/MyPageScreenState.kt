package com.coopelife.croissant.ui.screen.mypage

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.ui.screen.home.ErrorState

data class MyPageScreenState(
    val plans: List<Plan>,
    val error: ErrorState
) {
    fun errorOccurred(message: String?) = this.copy(
        error = ErrorState(
            errorOccurred = true,
            message = message
        )
    )
}
