package com.coopelife.croissant.android.ui.screen.mypage

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.coopelife.croissant.domain.usecase.FetchMyPlansUseCase
import com.coopelife.croissant.ui.screen.mypage.MyPageScreenState

internal class MypageScreenViewModel(
    private val fetchMyPlanUseCase: FetchMyPlansUseCase,
) : ViewModel() {
    private val _state: MutableLiveData<MyPageScreenState> =
        MutableLiveData(MyPageScreenState.generateInitialState())
    val state: LiveData<MyPageScreenState> = _state
}
