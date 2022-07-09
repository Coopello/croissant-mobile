package com.coopelife.croissant.android.ui.screen.mypage

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.coopelife.croissant.domain.usecase.FetchMyPlansUseCase

internal class MypageScreenViewModel(
    private val fetchMyPlanUseCase: FetchMyPlansUseCase,
) : ViewModel() {
    private val _previewText = MutableLiveData<String>("MypageScreen")
    val previewText: LiveData<String> = _previewText

    fun onValueChanged(value: String) {
        _previewText.value = value
    }
}
