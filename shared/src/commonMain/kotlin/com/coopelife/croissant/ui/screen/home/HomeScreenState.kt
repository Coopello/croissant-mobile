package com.coopelife.croissant.ui.screen.home

import com.coopelife.croissant.data.entitiy.Plan

data class HomeScreenState(
    val howManyDaysLaterIsBeingClicked: Int,
    val allPlans: List<Plan>,
    val error: ErrorState
) {
    fun errorOccurred(message: String?): HomeScreenState = this.copy(
        error = ErrorState(
            errorOccurred = true,
            message = message
        )
    )

    fun updateAllPlans(plans: List<Plan>) = this.copy(
        allPlans = plans
    )
}

