package com.coopelife.croissant.android.ui.screen.home

import androidx.lifecycle.ViewModel
import com.coopelife.croissant.domain.usecase.FetchRecentPlansUseCase

internal class HomeViewModel(
    private val fetchRecentPlansUseCase: FetchRecentPlansUseCase,
) : ViewModel()
