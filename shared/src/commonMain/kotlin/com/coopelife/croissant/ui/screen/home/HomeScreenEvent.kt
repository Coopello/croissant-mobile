package com.coopelife.croissant.ui.screen.home

sealed class HomeScreenEvent {
    class ClickDate(val howManyDaysLater: Int) : HomeScreenEvent()
    object DoNothing : HomeScreenEvent()
}
