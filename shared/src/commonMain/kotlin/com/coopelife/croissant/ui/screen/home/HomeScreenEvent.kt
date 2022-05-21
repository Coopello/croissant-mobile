package com.coopelife.croissant.ui.screen.home

import com.coopelife.croissant.data.entitiy.Plan

sealed class HomeScreenEvent {
    class ClickDate(val howManyDaysLater: Int) : HomeScreenEvent()
    object DoNothing : HomeScreenEvent()
    class UpdatePlans(val newPlans: List<Plan>) : HomeScreenEvent()
}
