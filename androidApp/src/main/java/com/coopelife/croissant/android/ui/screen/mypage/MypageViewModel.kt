package com.coopelife.croissant.android.ui.screen.mypage

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.domain.usecase.FetchMyPlansUseCase
import com.coopelife.croissant.ui.screen.home.ErrorState
import com.coopelife.croissant.ui.screen.mypage.MyPageScreenEvent
import com.coopelife.croissant.ui.screen.mypage.MyPageScreenState
import kotlinx.coroutines.launch

internal class MypageViewModel(
    private val fetchMyPlansUseCase: FetchMyPlansUseCase,
) : ViewModel() {
    private val _state: MutableLiveData<MyPageScreenState> =
        MutableLiveData(MyPageScreenState.generateInitialState())
    val state: LiveData<MyPageScreenState> = _state

    init {
        onInit()
    }

    fun onTriggerEvent(event: MyPageScreenEvent) {
        when (event) {
            is MyPageScreenEvent.OnInit -> onInit()
            is MyPageScreenEvent.OnUpdate -> {}
            is MyPageScreenEvent.OnUnFormedTabSelected -> {}
            is MyPageScreenEvent.OnHistoryTabSelected -> {}
            is MyPageScreenEvent.OnFormedTabSelected -> {}
            is MyPageScreenEvent.DoNothing -> {}
        }
    }

    private fun onInit() {
        viewModelScope.launch {
            runCatching {
                fetchMyPlansUseCase.fetchMyPlans()
            }.onSuccess { myPlans: List<Plan> ->
                _state.value = _state.value?.copy(
                    plans = myPlans.filter { it.status == Plan.PlanStatus.NOT_ESTABLISHED }
                )
            }.onFailure {
                _state.value = _state.value?.copy(
                    error = ErrorState(
                        errorOccurred = true,
                        message = "データの取得に失敗しました" // TODO: ハードコードの解消
                    )
                )
            }
        }
    }
}
