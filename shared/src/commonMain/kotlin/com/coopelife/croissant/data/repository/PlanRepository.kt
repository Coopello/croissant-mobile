package com.coopelife.croissant.data.repository

import com.coopelife.croissant.data.entitiy.Plan

interface PlanRepository {
    suspend fun fetchRecentPlans(): List<Plan>
}
