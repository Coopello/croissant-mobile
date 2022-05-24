package com.coopelife.croissant.domain.usecase

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.data.repository.PlanRepository
import com.coopelife.croissant.util.swiftCoroutines.FlowWrapper
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.flow

actual class FetchMyPlansUseCase actual constructor(
    planRepository: PlanRepository
) {
    private val planRepository: PlanRepository = planRepository
    private val supervisorJob = SupervisorJob()
    private val scope: CoroutineScope = CoroutineScope(supervisorJob + Dispatchers.Default)

    fun fetchMyPlans(): FlowWrapper<List<Plan>> = FlowWrapper(
        scope = scope,
        flow = flow {
            this.emit(planRepository.fetchMyPlans())
        }
    )
}