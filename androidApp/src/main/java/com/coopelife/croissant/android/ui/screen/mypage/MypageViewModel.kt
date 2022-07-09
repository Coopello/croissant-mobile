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
    private val _myPlanList: MutableList<Plan> = mutableListOf()
    private val myPlanList: List<Plan> = _myPlanList

    init {
        onInit()
    }

    fun onTriggerEvent(event: MyPageScreenEvent) {
        when (event) {
            is MyPageScreenEvent.OnInit -> onInit() // TODO: Screen で onTrigger を呼ぶように書き換える
            is MyPageScreenEvent.OnUpdate -> {
                // TODO: View でこの event を発火する UI を検討する
            }
            is MyPageScreenEvent.OnUnFormedTabSelected -> onTabSelected(Plan.PlanStatus.NOT_ESTABLISHED)
            is MyPageScreenEvent.OnHistoryTabSelected -> onTabSelected(Plan.PlanStatus.FINISHED)
            is MyPageScreenEvent.OnFormedTabSelected -> onTabSelected(Plan.PlanStatus.ESTABLISHED)
            is MyPageScreenEvent.DoNothing -> {
                // 何もしない
            }
        }
    }

    private fun onInit() {
        viewModelScope.launch {
            runCatching {
                fetchMyPlansUseCase.fetchMyPlans()
            }.onSuccess { newMyPlans: List<Plan> ->
                _myPlanList.addAll(newMyPlans)
                _state.value = _state.value?.copy(
                    plans = myPlanList.filter { it.status == Plan.PlanStatus.NOT_ESTABLISHED }
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

    private fun onTabSelected(planStatus: Plan.PlanStatus) {
        _state.value = when (planStatus) {
            Plan.PlanStatus.NOT_ESTABLISHED -> _state.value?.copy(
                plans = myPlanList.filter { it.status == Plan.PlanStatus.NOT_ESTABLISHED }
            )
            Plan.PlanStatus.ESTABLISHED -> _state.value?.copy(
                plans = myPlanList.filter { it.status == Plan.PlanStatus.ESTABLISHED }
            )
            Plan.PlanStatus.FINISHED -> _state.value?.copy(
                plans = myPlanList.filter { it.status == Plan.PlanStatus.FINISHED }
            )
        }
    }
}
