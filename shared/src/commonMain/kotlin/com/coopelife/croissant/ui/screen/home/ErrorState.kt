package com.coopelife.croissant.ui.screen.home

class ErrorState(
    val errorOccurred: Boolean,
    val message: String?,
) {
    companion object {
        fun generateInitialErrorState(): ErrorState = ErrorState(
            errorOccurred = false,
            message = null,
        )
    }
}
