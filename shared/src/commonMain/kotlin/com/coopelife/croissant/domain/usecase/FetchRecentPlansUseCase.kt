package com.coopelife.croissant.domain.usecase

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.data.repository.PlanRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

class FetchRecentPlansUseCase(
    private val planRepository: PlanRepository
) {
    fun fetchRecentPlans(): Flow<List<Plan>> = flow {
        this.emit(
            planRepository.fetchRecentPlans()
        )
    }
}