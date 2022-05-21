package com.coopelife.croissant.ui.activity

sealed class HomeActivityEvent {
    class OnTabClicked(val tabIndex: Int) : HomeActivityEvent()
    object DoNothing : HomeActivityEvent()
}
