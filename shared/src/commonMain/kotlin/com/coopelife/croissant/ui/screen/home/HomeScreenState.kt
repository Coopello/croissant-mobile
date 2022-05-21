package com.coopelife.croissant.ui.screen.home

import com.coopelife.croissant.data.entitiy.Plan

data class HomeScreenState(
    val howManyDaysLaterIsBeingClicked: Int,
    val error: ErrorState,
    val plans: List<Plan>,
    val dates: List<String>
) {
    fun errorOccurred(message: String?): HomeScreenState = this.copy(
        error = ErrorState(
            errorOccurred = true,
            message = message
        )
    )
}
