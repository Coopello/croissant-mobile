package com.coopelife.croissant.android.ui.screen.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.domain.usecase.FetchRecentPlansUseCase
import com.coopelife.croissant.ui.screen.home.ErrorState
import com.coopelife.croissant.ui.screen.home.HomeScreenEvent
import com.coopelife.croissant.ui.screen.home.HomeScreenState
import kotlinx.coroutines.launch
import java.text.SimpleDateFormat
import java.util.Calendar
import java.util.Date
import java.util.Locale

internal class HomeViewModel(
    private val fetchRecentPlansUseCase: FetchRecentPlansUseCase,
) : ViewModel() {
    companion object {
        private const val DATE_SELECT_PATTERN = "MM/dd"
    }

    private val _state: MutableLiveData<HomeScreenState> =
        MutableLiveData(HomeScreenState.generateInitialState())
    val state: LiveData<HomeScreenState> = _state
    private val _myPlanlist: MutableList<Plan> = mutableListOf()
    private val myPlanList: List<Plan> = _myPlanlist

    init {
        onInit()
    }

    fun onTriggerEvent(event: HomeScreenEvent) {
        when (event) {
            is HomeScreenEvent.UpdatePlans -> {}
            is HomeScreenEvent.ClickDate -> {}
            is HomeScreenEvent.DoNothing -> {
                // 何もしない
            }
        }
    }

    private fun onInit() {
        viewModelScope.launch {
            runCatching {
                fetchRecentPlansUseCase.fetchRecentPlans()
            }.onSuccess { newRecentPlans: List<Plan> ->
                _myPlanlist.addAll(newRecentPlans)
                _state.value = _state.value?.copy(
                    plans = myPlanList.filter { it.status == Plan.PlanStatus.NOT_ESTABLISHED },
                    dates = getDateList(),
                )
            }.onFailure {
                _state.value = _state.value?.copy(
                    error = ErrorState(
                        errorOccurred = true,
                        message = "プランの取得に失敗しました" // TODO: ハードコードの解消
                    )
                )
            }
        }
    }

    private fun getDateList(): List<String> = (0..4).map { howManyLater: Int ->
        Calendar.getInstance().apply {
            add(Calendar.DATE, howManyLater)
        }.time.toStringWithSimpleDateFormat()
    }

    private fun Date.toStringWithSimpleDateFormat(): String =
        SimpleDateFormat(
            DATE_SELECT_PATTERN,
            Locale.getDefault()
        ).format(this)
}
