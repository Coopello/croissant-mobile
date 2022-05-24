package com.coopelife.croissant.domain.usecase

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.data.repository.PlanRepository
import com.coopelife.croissant.util.swiftCoroutines.FlowWrapper
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.flow

actual class FetchRecentPlansUseCase actual constructor(
    planRepository: PlanRepository
) {
    private val planRepository: PlanRepository = planRepository
    private val supervisorJob = SupervisorJob()
    private val scope: CoroutineScope = CoroutineScope(supervisorJob + Dispatchers.Default)

    fun fetchRecentPlans(): FlowWrapper<List<Plan>> = FlowWrapper(
        scope,
        flow {
            this.emit(planRepository.fetchRecentPlans())
        }
    )
}