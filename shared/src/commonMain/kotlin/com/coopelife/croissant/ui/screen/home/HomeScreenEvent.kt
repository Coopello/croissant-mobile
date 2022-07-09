package com.coopelife.croissant.ui.screen.home

import com.coopelife.croissant.data.entitiy.Plan

sealed class HomeScreenEvent {
    class OnInit(
        val tabIndex: Int
    ) : HomeScreenEvent()

    class OnClickDate(
        val howManyDaysLater: Int
    ) : HomeScreenEvent()

    class OnUpdatePlans(
        val newPlans: List<Plan>
    ) : HomeScreenEvent()

    object OnUnFormedTabSelected : HomeScreenEvent()

    object OnFormedTabSelected : HomeScreenEvent()

    class OnClickParticipateButton(
        val planId: Int,
        val userId: Int,
    ) : HomeScreenEvent()

    object DoNothing : HomeScreenEvent()
}
