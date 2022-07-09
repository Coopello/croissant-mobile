package com.coopelife.croissant.android.ui.screen.home

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.coopelife.croissant.android.util.toStringWithSimpleDateFormat
import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.domain.usecase.FetchRecentPlansUseCase
import com.coopelife.croissant.ui.screen.home.HomeScreenEvent
import com.coopelife.croissant.ui.screen.home.HomeScreenState
import java.util.Calendar

internal class HomeViewModel(
    private val fetchRecentPlansUseCase: FetchRecentPlansUseCase,
) : ViewModel() {
    private val _state: MutableLiveData<HomeScreenState> =
        MutableLiveData(HomeScreenState.generateInitialState())
    val state: LiveData<HomeScreenState> = _state
    private val _myPlanlist: MutableList<Plan> = mutableListOf()
    private val myPlanList: List<Plan> = _myPlanlist

    init {
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

    private fun getDateList(): List<String> = (0..4).map { howManyLater: Int ->
        Calendar.getInstance().apply {
            add(Calendar.DATE, howManyLater)
        }.time.toStringWithSimpleDateFormat()
    }
}
