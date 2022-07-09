package com.coopelife.croissant.domain.usecase

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.data.repository.PlanRepository

actual class FetchMyPlansUseCase actual constructor(
    planRepository: PlanRepository
) {
    private val planRepository: PlanRepository = planRepository

    suspend fun fetchMyPlans(): List<Plan> = planRepository.fetchMyPlans()
}
