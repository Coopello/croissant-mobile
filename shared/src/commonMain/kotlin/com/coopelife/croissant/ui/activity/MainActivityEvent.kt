package com.coopelife.croissant.ui.activity

sealed class MainActivityEvent {
    object OnHomeClick : MainActivityEvent()
    object OnMyPageClick : MainActivityEvent()
}
