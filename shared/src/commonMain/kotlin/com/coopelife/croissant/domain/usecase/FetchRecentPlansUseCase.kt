package com.coopelife.croissant.domain.usecase

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.data.repository.PlanRepository
import com.coopelife.croissant.ui.util.Closeable
import com.coopelife.croissant.ui.util.observe
import kotlinx.coroutines.flow.flow

class FetchRecentPlansUseCase(
    private val planRepository: PlanRepository
) {
    fun fetchRecentPlans(
        onEach: (List<Plan>) -> Unit,
        onCompletion: (Throwable?) -> Unit
    ): Closeable = flow {
        this.emit(
            planRepository.fetchRecentPlans()
        )
    }.observe(
        onEach = onEach,
        onCompletion = onCompletion
    )
}

