package com.coopelife.croissant.ui.screen.home

data class HomeScreenState(
    val howManyDaysLaterIsBeingClicked: Int,
    val error: ErrorState
) {
    fun errorOccurred(message: String?): HomeScreenState = this.copy(
        error = ErrorState(
            errorOccurred = true,
            message = message
        )
    )
}

