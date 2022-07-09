package com.coopelife.croissant.ui.screen.mypage

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.ui.screen.home.ErrorState

data class MyPageScreenState(
    val plans: List<Plan>,
    val error: ErrorState
) {
    companion object {
        fun generateInitialState(): MyPageScreenState = MyPageScreenState(
            plans = emptyList(),
            error = ErrorState.generateInitialErrorState()
        )
    }

    fun errorOccurred(message: String?) = this.copy(
        error = ErrorState(
            errorOccurred = true,
            message = message
        )
    )
}
