package com.coopelife.croissant.ui.activity

class MainActivityState(
    val isHomeClicked: Boolean,
    val isMyPageClicked: Boolean
) {
    companion object {
        fun initial() = MainActivityState(
            isHomeClicked = true,
            isMyPageClicked = false
        )
    }
}
