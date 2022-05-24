package com.coopelife.croissant.domain.usecase

import com.coopelife.croissant.data.repository.PlanRepository

expect class FetchMyPlansUseCase(
    planRepository: PlanRepository
)
