package com.coopelife.croissant.data.repository

import com.coopelife.croissant.data.entitiy.Plan
import com.coopelife.croissant.util.swiftCoroutines.SuspendWrapper
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob

class PlansRepositoryIos(
    private val repository: PlanRepository
) {
    private val supervisorJob = SupervisorJob()
    private val scope: CoroutineScope = CoroutineScope(supervisorJob + Dispatchers.Default)

    fun fetchRecentPlans(): SuspendWrapper<List<Plan>> = SuspendWrapper(scope) {
        repository.fetchRecentPlans()
    }
}