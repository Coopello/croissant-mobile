package com.coopelife.croissant.ui.screen.home

import com.coopelife.croissant.data.entitiy.Plan

data class HomeScreenState(
    val howManyDaysLaterIsBeingClicked: Int,
    val error: ErrorState,
    val plans: List<Plan>,
    val dates: List<String>
) {
    companion object {
        fun generateInitialState(): HomeScreenState = HomeScreenState(
            howManyDaysLaterIsBeingClicked = 0,
            error = ErrorState.generateInitialErrorState(),
            plans = emptyList(),
            dates = emptyList(),
        )
    }

    fun errorOccurred(message: String?): HomeScreenState = this.copy(
        error = ErrorState(
            errorOccurred = true,
            message = message
        )
    )
}
